import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/shared/chat_response_model.dart';
import 'package:warehouse/presentation/bloc/chat/chat_bloc.dart';

// ── WhatsApp-like colors ──────────────────────────────────────────────────────
const _primary = Color(0xFF0D47A1); // biru tua (app bar)
const _primaryLight = Color(0xFF1565C0); // biru medium (accent text/icon)
const _accent = Color(0xFF2196F3); // biru terang (tombol kirim, FAB)
const _bgChat = Color(0xFFE3F2FD); // biru sangat muda (bg chat)
const _bubbleMe = Color(0xFFBBDEFB); // bubble kanan (saya) - biru muda
const _bubbleOther = Colors.white; // bubble kiri (lawan) tetap putih
const _textDark = Color(0xFF1A1A1A);
const _textGrey = Color(0xFF667781);
const _tick = Color(
    0xFF2196F3); // double tick biru// ─────────────────────────────────────────────────────────────────────────────

class ChatDetailPage extends StatefulWidget {
  final int chatId;
  final String partnerName;
  final String? prefillMessage;

  const ChatDetailPage({
    super.key,
    required this.chatId,
    required this.partnerName,
    this.prefillMessage,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final _textCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();
  int? _myUserId;
  final List<_LocalMsg> _messages = [];
  bool _initialLoaded = false;
  bool _typing = false;

  late ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = context.read<ChatBloc>();
    _chatBloc.add(const ChatEvent.disconnectRealtime());
    _loadMyId();
    _chatBloc.add(ChatEvent.loadDetail(widget.chatId));
    if (widget.prefillMessage?.isNotEmpty == true) {
      _textCtrl.text = widget.prefillMessage!;
      _typing = true;
    }
  }

  Future<void> _loadMyId() async {
    final auth = await AuthLocalDatasource().getAuthData();
    if (mounted) setState(() => _myUserId = auth?.user?.id);
  }

  @override
  void dispose() {
    context.read<ChatBloc>().add(const ChatEvent.disconnectRealtime());
    _chatBloc.add(const ChatEvent.disconnectRealtime());
    _textCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _scrollToBottom({bool animate = true}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollCtrl.hasClients) return;
      final max = _scrollCtrl.position.maxScrollExtent;
      if (animate) {
        _scrollCtrl.animateTo(
          max + 100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        _scrollCtrl.jumpTo(max + 100);
      }
    });
  }

  void _send() {
    final text = _textCtrl.text.trim();
    if (text.isEmpty) return;
    HapticFeedback.lightImpact();

    final tempId = -(DateTime.now().millisecondsSinceEpoch);
    setState(() {
      _messages.add(_LocalMsg(
        tempId: tempId,
        text: text,
        fromMe: true,
        time: DateTime.now(),
        status: _TickStatus.sending,
      ));
      _textCtrl.clear();
      _typing = false;
    });
    _scrollToBottom();

    context.read<ChatBloc>().add(ChatEvent.sendMessage(
          chatId: widget.chatId,
          message: text,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        state.maybeWhen(
          // ── History pesan dimuat ────────────────────────────────────────
          detailLoaded: (chat, messages) {
            if (_initialLoaded) return;
            setState(() {
              _messages.clear();
              for (final m in messages) {
                _messages.add(_LocalMsg.fromServer(m, _myUserId));
              }
              _initialLoaded = true;
            });
            _scrollToBottom(animate: false);
          },

          // ── Konfirmasi dari server setelah kirim ────────────────────────
          messageSent: (msg) {
            setState(() {
              final idx = _messages
                  .indexWhere((m) => m.tempId != null && m.tempId! < 0);
              final confirmed = _LocalMsg.fromServer(msg, _myUserId)
                ..status = _TickStatus.sent;
              if (idx != -1) {
                _messages[idx] = confirmed;
              } else {
                _messages.add(confirmed);
              }
            });
            Future.delayed(const Duration(seconds: 1), () {
              if (!mounted) return;
              setState(() {
                final idx = _messages.lastIndexWhere(
                    (m) => m.fromMe && m.status == _TickStatus.sent);
                if (idx != -1) _messages[idx].status = _TickStatus.delivered;
              });
            });
          },

          // ── Pesan realtime masuk via Reverb ─────────────────────────────
          realtimeMessage: (msg) {
            // Jangan tampilkan pesan sendiri dua kali
            final alreadyExists = _messages.any((m) => m.serverId == msg.id);
            if (alreadyExists) return;

            setState(() {
              _messages.add(_LocalMsg.fromServer(msg, _myUserId));
            });
            _scrollToBottom();
            HapticFeedback.lightImpact();
          },

          error: (msg) {
            setState(() => _messages
                .removeWhere((m) => m.tempId != null && m.tempId! < 0));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(msg), backgroundColor: Colors.red.shade700),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: _bgChat,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Expanded(child: _buildMessageList()),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  // ── App Bar (WhatsApp style) ──────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    final initials = widget.partnerName.isNotEmpty
        ? widget.partnerName
            .trim()
            .split(' ')
            .take(2)
            .map((p) => p[0])
            .join()
            .toUpperCase()
        : '?';

    return AppBar(
      backgroundColor: _primary,
      foregroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 30,
      titleSpacing: 0,
      title: InkWell(
        onTap: () {}, // bisa buka profil
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white.withOpacity(0.2),
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.partnerName.isEmpty ? 'Chat' : widget.partnerName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam_outlined),
          onPressed: () => _showDevDialog('Video Call'),
        ),
        IconButton(
          icon: const Icon(Icons.call_outlined),
          onPressed: () => _showDevDialog('Panggilan Suara'),
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          color: Colors.white,
          onSelected: (v) {
            if (v == 'clear') {
              setState(() => _messages.clear());
            }
          },
          itemBuilder: (_) => [
            const PopupMenuItem(
                value: 'clear', child: Text('Hapus riwayat (lokal)')),
          ],
        ),
      ],
    );
  }

  // ── Message list ──────────────────────────────────────────────────────────
  Widget _buildMessageList() {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        final isLoading =
            state.maybeWhen(loading: () => true, orElse: () => false);

        if (isLoading && _messages.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: _primary),
          );
        }

        if (_messages.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lock_outline, size: 20, color: Colors.grey.shade500),
                const SizedBox(height: 6),
                Text(
                  'Pesan dienkripsi end-to-end',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          );
        }

        // Kelompokkan pesan per tanggal
        return ListView.builder(
          controller: _scrollCtrl,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          itemCount: _messages.length,
          itemBuilder: (_, i) {
            final msg = _messages[i];
            final showDate =
                i == 0 || !DateUtils.isSameDay(msg.time, _messages[i - 1].time);
            return Column(
              children: [
                if (showDate) _dateDivider(msg.time),
                _buildBubble(msg),
              ],
            );
          },
        );
      },
    );
  }

  // ── Date divider ──────────────────────────────────────────────────────────
  Widget _dateDivider(DateTime dt) {
    final now = DateTime.now();
    String label;
    if (DateUtils.isSameDay(dt, now)) {
      label = 'Hari ini';
    } else if (DateUtils.isSameDay(dt, now.subtract(const Duration(days: 1)))) {
      label = 'Kemarin';
    } else {
      label = DateFormat('d MMMM yyyy', 'id').format(dt);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFD1F2E8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 11,
                color: _primaryLight,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  // ── Bubble ────────────────────────────────────────────────────────────────
  Widget _buildBubble(_LocalMsg msg) {
    final me = msg.fromMe;

    return Align(
      alignment: me ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 2,
          bottom: 2,
          left: me ? 60 : 0,
          right: me ? 0 : 60,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Bubble
            Flexible(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 7, 10, 5),
                decoration: BoxDecoration(
                  color: me ? _bubbleMe : _bubbleOther,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: Radius.circular(me ? 12 : 2),
                    bottomRight: Radius.circular(me ? 2 : 12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Nama pengirim (untuk pesan dari orang lain)
                    if (!me && widget.partnerName.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          widget.partnerName,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: _primaryLight,
                          ),
                        ),
                      ),
                    // Teks pesan
                    Text(
                      msg.text ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: _textDark,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Waktu + tick
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateFormat('HH:mm').format(msg.time),
                          style: const TextStyle(
                            fontSize: 10,
                            color: _textGrey,
                          ),
                        ),
                        if (me) ...[
                          const SizedBox(width: 3),
                          _tickWidget(msg.status),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tickWidget(_TickStatus status) {
    switch (status) {
      case _TickStatus.sending:
        return Icon(Icons.access_time_rounded,
            size: 12, color: Colors.grey.shade400);
      case _TickStatus.sent:
        return Icon(Icons.check_rounded, size: 14, color: Colors.grey.shade600);
      case _TickStatus.delivered:
        return Icon(Icons.done_all_rounded,
            size: 14, color: Colors.grey.shade600);
      case _TickStatus.read:
        return const Icon(Icons.done_all_rounded, size: 14, color: _tick);
    }
  }

  // ── Input bar (WhatsApp style) ────────────────────────────────────────────
  Widget _buildInputBar() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Text input
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 120),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12, bottom: 10),
                      child: Icon(Icons.emoji_emotions_outlined,
                          color: _textGrey, size: 22),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _textCtrl,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        onChanged: (v) =>
                            setState(() => _typing = v.isNotEmpty),
                        style: const TextStyle(fontSize: 15, color: _textDark),
                        decoration: const InputDecoration(
                          hintText: 'Ketik pesan',
                          hintStyle: TextStyle(color: _textGrey, fontSize: 15),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 8),
                      child: Icon(
                        Icons.attach_file_rounded,
                        color: _textGrey,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 6),
            // Tombol kirim / mic
            GestureDetector(
              onTap: _typing ? _send : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _typing ? _accent : _primaryLight,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  _typing ? Icons.send_rounded : Icons.mic_none_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDevDialog(String feature) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(feature),
        content: Text('Fitur "$feature" sedang dalam pengembangan.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: _primary)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Local message model
// ─────────────────────────────────────────────────────────────────────────────

enum _TickStatus { sending, sent, delivered, read }

class _LocalMsg {
  final int? tempId;
  final int? serverId;
  final String? text;
  final bool fromMe;
  final DateTime time;
  _TickStatus status;

  _LocalMsg({
    this.tempId,
    this.serverId,
    this.text,
    required this.fromMe,
    required this.time,
    this.status = _TickStatus.sent,
  });

  factory _LocalMsg.fromServer(ChatMessageModel m, int? myUserId) {
    final isMe = m.senderId == myUserId;
    DateTime t;
    try {
      t = DateTime.parse(m.createdAt ?? '').toLocal();
    } catch (_) {
      t = DateTime.now();
    }
    return _LocalMsg(
      serverId: m.id,
      text: m.message,
      fromMe: isMe,
      time: t,
      status: isMe
          ? (m.isRead ? _TickStatus.read : _TickStatus.delivered)
          : _TickStatus.read,
    );
  }
}
