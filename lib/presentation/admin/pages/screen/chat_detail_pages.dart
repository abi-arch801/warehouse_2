import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class ChatDetailScreen extends StatefulWidget {
  final AppUser currentUser;
  final String threadId;

  const ChatDetailScreen({
    super.key,
    required this.currentUser,
    required this.threadId,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _ctrl = TextEditingController();
  final ScrollController _scroll = ScrollController();
  bool _typing = false;

  ChatThread get _thread =>
      MockDB.instance.chatById(widget.threadId)!;

  AppUser? get _participant =>
      MockDB.instance.userById(_thread.participantId);

  @override
  void initState() {
    super.initState();
    // Reset unread saat thread dibuka
    _thread.unread = 0;
    _ctrl.addListener(() {
      final has = _ctrl.text.trim().isNotEmpty;
      if (has != _typing) setState(() => _typing = has);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _scrollToBottom({bool animate = false}) {
    if (!_scroll.hasClients) return;
    final pos = _scroll.position.maxScrollExtent;
    if (animate) {
      _scroll.animateTo(
        pos,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    } else {
      _scroll.jumpTo(pos);
    }
  }

  void _send({String? attachmentName}) {
    final text = _ctrl.text.trim();
    if (text.isEmpty && attachmentName == null) return;
    final msg = ChatMessage(
      id: 'm${DateTime.now().millisecondsSinceEpoch}',
      senderId: widget.currentUser.id,
      text: text.isEmpty ? '(Lampiran)' : text,
      sentAt: DateTime.now(),
      isMe: true,
      attachmentName: attachmentName,
    );
    setState(() {
      _thread.messages.add(msg);
      _ctrl.clear();
      _typing = false;
    });
    HapticFeedback.lightImpact();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToBottom(animate: true),
    );

    // Simulasi auto-reply ringan supaya UI hidup
    Future.delayed(const Duration(milliseconds: 1300), () {
      if (!mounted) return;
      final partner = _participant;
      if (partner == null) return;
      setState(() {
        _thread.messages.add(
          ChatMessage(
            id: 'm${DateTime.now().millisecondsSinceEpoch}r',
            senderId: partner.id,
            text: 'Noted, saya cek dulu ya.',
            sentAt: DateTime.now(),
            isMe: false,
          ),
        );
      });
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollToBottom(animate: true),
      );
    });
  }

  void _pickAttachment() {
    HapticFeedback.selectionClick();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => SafeArea(
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
              const Text('Lampirkan Dokumen',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 14),
              _attachOpt(Icons.description_rounded, 'SPK Marketing.pdf'),
              _attachOpt(Icons.receipt_long_rounded, 'PO/2026/0002.pdf'),
              _attachOpt(Icons.assignment_rounded, 'BAST Internal.pdf'),
              _attachOpt(Icons.image_rounded, 'foto_stok_perakitan.jpg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _attachOpt(IconData icon, String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
            _send(attachmentName: name);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.infoSoft,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: AppColors.info, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(name,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600)),
                ),
                const Icon(Icons.chevron_right,
                    color: AppColors.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final partner = _participant;
    final wh = partner?.warehouseId != null
        ? MockDB.instance.warehouseById(partner!.warehouseId!)
        : null;
    final messages = _thread.messages;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.85),
                    AppColors.accent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                (partner?.name.isNotEmpty == true)
                    ? partner!.name.substring(0, 1)
                    : '?',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(partner?.name ?? 'Pengguna',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15)),
                  Text(
                    [
                      partner?.role.label ?? '',
                      if (wh != null) wh.name,
                      'Online',
                    ].where((e) => e.isNotEmpty).join(' · '),
                    style: const TextStyle(
                      color: AppColors.success,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Telepon',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur panggilan belum tersedia')),
              );
            },
            icon: const Icon(Icons.call_rounded),
          ),
          IconButton(
            tooltip: 'Info',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Chat ini privat antara Anda dan ${partner?.name ?? "rekan"}.'),
                ),
              );
            },
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: AppColors.primarySoft,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.waving_hand_rounded,
                              color: AppColors.primary,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Mulai percakapan',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Sapa ${partner?.name ?? "rekan"} untuk koordinasi alur warehouse.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    controller: _scroll,
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                    itemCount: messages.length,
                    itemBuilder: (_, i) {
                      final m = messages[i];
                      final showDate = i == 0 ||
                          !_sameDay(messages[i - 1].sentAt, m.sentAt);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (showDate) _dateChip(m.sentAt),
                          _bubble(m),
                        ],
                      );
                    },
                  ),
          ),
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  top: BorderSide(color: AppColors.border),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Material(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: _pickAttachment,
                      child: Container(
                        width: 44,
                        height: 44,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.attach_file_rounded,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 120),
                      decoration: BoxDecoration(
                        color: AppColors.bg,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: AppColors.border),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 14),
                      child: TextField(
                        controller: _ctrl,
                        textInputAction: TextInputAction.send,
                        minLines: 1,
                        maxLines: 5,
                        onSubmitted: (_) => _send(),
                        decoration: const InputDecoration(
                          hintText: 'Tulis pesan...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, anim) =>
                        ScaleTransition(scale: anim, child: child),
                    child: Material(
                      key: ValueKey(_typing),
                      color: _typing
                          ? AppColors.primary
                          : AppColors.primarySoft,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: _typing ? () => _send() : null,
                        child: Container(
                          width: 46,
                          height: 46,
                          alignment: Alignment.center,
                          child: Icon(
                            _typing
                                ? Icons.send_rounded
                                : Icons.mic_rounded,
                            color: _typing
                                ? Colors.white
                                : AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateChip(DateTime d) {
    final label = _formatDateHeader(d);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.primarySoft,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.primaryDark,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _bubble(ChatMessage m) {
    final isMe = m.isMe;
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: Radius.circular(isMe ? 16 : 4),
      bottomRight: Radius.circular(isMe ? 4 : 16),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              builder: (_, v, child) => Opacity(
                opacity: v,
                child: Transform.translate(
                  offset: Offset(0, (1 - v) * 6),
                  child: child,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: isMe ? 60 : 0,
                  right: isMe ? 0 : 60,
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: isMe ? AppColors.primary : AppColors.surface,
                  borderRadius: radius,
                  border: isMe
                      ? null
                      : Border.all(color: AppColors.border),
                  boxShadow: isMe
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.18),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (m.attachmentName != null) ...[
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Colors.white.withValues(alpha: 0.18)
                              : AppColors.infoSoft,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.insert_drive_file_rounded,
                              size: 18,
                              color: isMe ? Colors.white : AppColors.info,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                m.attachmentName!,
                                style: TextStyle(
                                  color: isMe ? Colors.white : AppColors.info,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    Text(
                      m.text,
                      style: TextStyle(
                        color: isMe ? Colors.white : AppColors.text,
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _formatTime(m.sentAt),
                          style: TextStyle(
                            color: isMe
                                ? Colors.white.withValues(alpha: 0.85)
                                : AppColors.textMuted,
                            fontSize: 10.5,
                          ),
                        ),
                        if (isMe) ...[
                          const SizedBox(width: 4),
                          Icon(
                            Icons.done_all_rounded,
                            size: 12,
                            color: Colors.white.withValues(alpha: 0.95),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String _formatDateHeader(DateTime d) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final that = DateTime(d.year, d.month, d.day);
    final diff = today.difference(that).inDays;
    if (diff == 0) return 'Hari ini';
    if (diff == 1) return 'Kemarin';
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }
}
