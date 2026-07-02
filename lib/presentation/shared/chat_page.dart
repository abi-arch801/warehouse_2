import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/model/response/shared/chat_response_model.dart';
import 'package:warehouse/presentation/bloc/chat/chat_bloc.dart';
import 'package:warehouse/presentation/shared/chat_detail_page.dart';
import 'package:warehouse/presentation/shared/user_list_page.dart';

// ── WhatsApp-like colors ──────────────────────────────────────────────────────
const _primary      = Color(0xFF0D47A1);
const _primaryLight = Color(0xFF1565C0);
const _accent       = Color(0xFF2196F3);
const _bg           = Color(0xFFF0F0F0);
const _textDark     = Color(0xFF1A1A1A);
const _textGrey     = Color(0xFF667781);
const _divider      = Color(0xFFE9EDEF);
// ─────────────────────────────────────────────────────────────────────────────

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  final _searchCtrl = TextEditingController();
  bool _searching = false;
  String _search = '';

  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  void _loadChats() =>
      context.read<ChatBloc>().add(const ChatEvent.loadChats());

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: _primary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            state.maybeWhen(
              chatCreated: (chatId) {
                if (chatId > 0) _openChatDetail(chatId, '');
                _loadChats();
              },
              error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                  backgroundColor: Colors.red.shade700,
                ),
              ),
              orElse: () {},
            );
          },
          builder: (context, state) {
            final chats = state.maybeWhen(
              chatsLoaded: (list) => list,
              orElse: () => <ChatModel>[],
            );
            final isLoading =
                state.maybeWhen(loading: () => true, orElse: () => false);

            final filtered = _search.isEmpty
                ? chats
                : chats.where((c) {
                    final name =
                        (c.partner?.name ?? '').toLowerCase();
                    final msg =
                        (c.latestMessage?.message ?? '').toLowerCase();
                    final q = _search.toLowerCase();
                    return name.contains(q) || msg.contains(q);
                  }).toList();

            final totalUnread =
                chats.fold(0, (s, c) => s + c.unreadCount);

            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: _primary),
              );
            }

            return RefreshIndicator(
              color: _primary,
              onRefresh: () async => _loadChats(),
              child: filtered.isEmpty
                  ? _buildEmpty()
                  : Column(
                      children: [
                        if (totalUnread > 0)
                          _buildUnreadBanner(totalUnread),
                        Expanded(
                          child: ListView.separated(
                            physics:
                                const AlwaysScrollableScrollPhysics(),
                            itemCount: filtered.length,
                            separatorBuilder: (_, __) => Divider(
                              height: 1,
                              color: _divider,
                              indent: 76,
                            ),
                            itemBuilder: (_, i) =>
                                _chatTile(filtered[i]),
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: _accent,
          foregroundColor: Colors.white,
          onPressed: _openUserList,
          child: const Icon(Icons.chat_rounded),
        ),
      ),
    );
  }

  // ── AppBar ────────────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: _primary,
      foregroundColor: Colors.white,
      elevation: 0,
      title: _searching
          ? TextField(
              controller: _searchCtrl,
              autofocus: true,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Cari pesan...',
                hintStyle:
                    TextStyle(color: Colors.white.withOpacity(0.7)),
                border: InputBorder.none,
              ),
              onChanged: (v) => setState(() => _search = v),
            )
          : const Text(
              'GudangPro Chat',
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 19),
            ),
      actions: [
        IconButton(
          icon: Icon(_searching ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              _searching = !_searching;
              if (!_searching) {
                _searchCtrl.clear();
                _search = '';
              }
            });
          },
        ),
        if (!_searching)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
            onSelected: (v) {
              if (v == 'refresh') _loadChats();
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'refresh',
                child: Row(
                  children: [
                    Icon(Icons.refresh, size: 18, color: _primary),
                    SizedBox(width: 10),
                    Text('Refresh'),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  // ── Unread banner ─────────────────────────────────────────────────────────
  Widget _buildUnreadBanner(int count) => Container(
        color: _accent.withOpacity(0.1),
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.mark_chat_unread_outlined,
                size: 16, color: _accent),
            const SizedBox(width: 8),
            Text(
              '$count pesan belum dibaca',
              style: const TextStyle(
                  color: _primaryLight,
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ],
        ),
      );

  // ── Chat tile (WhatsApp style) ────────────────────────────────────────────
  Widget _chatTile(ChatModel chat) {
    final hasUnread = chat.unreadCount > 0;
    final name      = chat.partner?.name ?? 'Unknown';
    final initials  = chat.partner?.initials ?? '?';
    final lastMsg   = chat.latestMessage?.message ?? '';
    final time      = _formatTime(chat.lastMessageAt);
    final roleColor = _roleColor(chat.partner?.role);

    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        _openChatDetail(chat.id, name);
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: roleColor.withOpacity(0.15),
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: roleColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
                // Role badge
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: roleColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Icon(
                      _roleIcon(chat.partner?.role),
                      size: 8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: hasUnread
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: _textDark,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 11,
                          color: hasUnread ? _accent : _textGrey,
                          fontWeight: hasUnread
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          lastMsg.isEmpty ? 'Mulai percakapan' : lastMsg,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: hasUnread
                                ? _textDark
                                : _textGrey,
                            fontWeight: hasUnread
                                ? FontWeight.w500
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                      if (hasUnread)
                        Container(
                          margin: const EdgeInsets.only(left: 6),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: _accent,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            chat.unreadCount > 99
                                ? '99+'
                                : '${chat.unreadCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Empty state ───────────────────────────────────────────────────────────
  Widget _buildEmpty() => Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: _primary.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 48,
                  color: _primary,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Belum ada percakapan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tekan tombol chat di bawah\nuntuk memulai percakapan baru.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      );

  // ── Helpers ───────────────────────────────────────────────────────────────
  void _openChatDetail(int chatId, String partnerName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) =>
              ChatBloc()..add(ChatEvent.loadDetail(chatId)),
          child: ChatDetailPage(
            chatId: chatId,
            partnerName: partnerName,
          ),
        ),
      ),
    ).then((_) => _loadChats());
  }

  void _openUserList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ChatBloc>(),
          child: const UserListPage(),
        ),
      ),
    ).then((chatId) {
      if (chatId is int && chatId > 0) {
        _openChatDetail(chatId, '');
      }
      _loadChats();
    });
  }

  Color _roleColor(String? role) {
    switch (role) {
      case 'superadmin': return const Color(0xFF9C27B0);
      case 'admin':      return _primaryLight;
      default:           return _textGrey;
    }
  }

  IconData _roleIcon(String? role) {
    switch (role) {
      case 'superadmin': return Icons.star;
      case 'admin':      return Icons.shield;
      default:           return Icons.person;
    }
  }

  String _formatTime(String? raw) {
    if (raw == null) return '';
    try {
      final dt  = DateTime.parse(raw).toLocal();
      final now = DateTime.now();
      if (DateUtils.isSameDay(dt, now)) return DateFormat('HH:mm').format(dt);
      if (DateUtils.isSameDay(dt, now.subtract(const Duration(days: 1)))) {
        return 'Kemarin';
      }
      return DateFormat('d MMM').format(dt);
    } catch (_) {
      return '';
    }
  }
}