import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/chat_detail_pages.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class ChatScreen extends StatefulWidget {
  final AppUser currentUser;
  const ChatScreen({super.key, required this.currentUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _search = '';

  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  void _openThread(ChatThread thread) async {
    HapticFeedback.selectionClick();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatDetailScreen(
          currentUser: widget.currentUser,
          threadId: thread.id,
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  void _newChat() {
    HapticFeedback.selectionClick();
    final db = MockDB.instance;
    final candidates =
        db.users.where((u) => u.id != widget.currentUser.id).toList();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const Text(
                  'Mulai percakapan baru',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Pilih rekan kerja gudang untuk memulai chat.',
                  style: TextStyle(
                      color: AppColors.textMuted, fontSize: 12.5),
                ),
                const SizedBox(height: 14),
                ...candidates.map((u) {
                  final wh = u.warehouseId != null
                      ? db.warehouseById(u.warehouseId!)
                      : null;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Material(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Navigator.pop(ctx);
                          final existing = db.chats.firstWhere(
                            (c) => c.participantId == u.id,
                            orElse: () {
                              final created = ChatThread(
                                id: 'ch${DateTime.now().millisecondsSinceEpoch}',
                                participantId: u.id,
                                messages: [],
                              );
                              db.chats.insert(0, created);
                              return created;
                            },
                          );
                          _openThread(existing);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              _avatar(u.name, u.role),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(u.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                      '${u.role.label}'
                                      '${wh != null ? ' · ${wh.name}' : ''}',
                                      style: const TextStyle(
                                          color: AppColors.textMuted,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right,
                                  color: AppColors.textMuted),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final all = [...db.chats]
      ..sort((a, b) {
        if (a.pinned != b.pinned) return a.pinned ? -1 : 1;
        return b.updatedAt.compareTo(a.updatedAt);
      });
    final threads = all.where((t) {
      if (_search.isEmpty) return true;
      final user = db.userById(t.participantId);
      final name = user?.name.toLowerCase() ?? '';
      final last = t.lastMessage?.text.toLowerCase() ?? '';
      final q = _search.toLowerCase();
      return name.contains(q) || last.contains(q);
    }).toList();

    final totalUnread = db.totalUnreadChats();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Chat Tim'),
            const SizedBox(width: 10),
            if (totalUnread > 0)
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.dangerSoft,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$totalUnread baru',
                  style: const TextStyle(
                    color: AppColors.danger,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Cari',
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _newChat,
        icon: const Icon(Icons.chat_bubble_rounded),
        label: const Text('Chat Baru'),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari nama atau pesan...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: _search.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: () => setState(() => _search = ''),
                          ),
                  ),
                  onChanged: (v) => setState(() => _search = v),
                ),
              ),
            ),
            if (threads.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.primarySoft,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.forum_rounded,
                          size: 36,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Belum ada percakapan',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Mulai chat dengan rekan tim untuk berkoordinasi soal PO, request, atau opname.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.textMuted, fontSize: 12.5),
                      ),
                    ],
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 100),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      final t = threads[i];
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(
                            milliseconds:
                                250 + (i * 60).clamp(0, 600)),
                        curve: Curves.easeOut,
                        builder: (_, v, child) => Opacity(
                          opacity: v,
                          child: Transform.translate(
                            offset: Offset(0, (1 - v) * 12),
                            child: child,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _threadTile(t),
                        ),
                      );
                    },
                    childCount: threads.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _threadTile(ChatThread t) {
    final db = MockDB.instance;
    final user = db.userById(t.participantId);
    final last = t.lastMessage;
    final isMine = last?.isMe ?? false;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _openThread(t),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(
              color: t.unread > 0
                  ? AppColors.primary.withValues(alpha: 0.45)
                  : AppColors.border,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  _avatar(user?.name ?? '?', user?.role),
                  if (t.pinned)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: AppColors.warning,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.surface, width: 1.5),
                        ),
                        child: const Icon(Icons.push_pin_rounded,
                            size: 9, color: Colors.white),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            user?.name ?? 'Pengguna',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: t.unread > 0
                                  ? FontWeight.w800
                                  : FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          last == null ? '' : _formatTime(last.sentAt),
                          style: TextStyle(
                            fontSize: 11,
                            color: t.unread > 0
                                ? AppColors.primary
                                : AppColors.textMuted,
                            fontWeight: t.unread > 0
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        if (isMine) ...[
                          const Icon(Icons.done_all_rounded,
                              size: 14, color: AppColors.info),
                          const SizedBox(width: 4),
                        ],
                        if (last?.attachmentName != null) ...[
                          const Icon(Icons.attach_file_rounded,
                              size: 13, color: AppColors.textMuted),
                          const SizedBox(width: 4),
                        ],
                        Expanded(
                          child: Text(
                            last == null
                                ? 'Belum ada pesan, sapa duluan!'
                                : (isMine ? 'Anda: ${last.text}' : last.text),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.5,
                              color: t.unread > 0
                                  ? AppColors.text
                                  : AppColors.textMuted,
                              fontWeight: t.unread > 0
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                        if (t.unread > 0) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                            ),
                            child: Text(
                              '${t.unread}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatar(String name, [UserRole? role]) {
    final initial = name.trim().isEmpty ? '?' : name.trim().substring(0, 1);
    final color =
        role == UserRole.superAdmin ? AppColors.primary : AppColors.accent;
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.85), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }

  String _formatTime(DateTime t) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final that = DateTime(t.year, t.month, t.day);
    final diffDays = today.difference(that).inDays;
    if (diffDays == 0) {
      final h = t.hour.toString().padLeft(2, '0');
      final m = t.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }
    if (diffDays == 1) return 'Kemarin';
    if (diffDays < 7) {
      const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
      return days[t.weekday - 1];
    }
    return '${t.day}/${t.month}';
  }
}
