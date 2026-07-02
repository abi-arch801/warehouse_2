import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/auth/auth_response_model.dart';
import 'package:warehouse/presentation/bloc/chat/chat_bloc.dart';
import 'package:warehouse/presentation/shared/chat_detail_page.dart';

const _primary = Color(0xFF0D47A1); // biru tua
const _primaryLight = Color(0xFF1565C0);
const _accent = Color(0xFF2196F3);
const _bg = Color(0xFFF0F0F0);
const _textDark = Color(0xFF1A1A1A);
const _textGrey = Color(0xFF667781);

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final _searchCtrl = TextEditingController();
  bool _searching = false;
  UserModel? _selectedUser; // user yang sedang dibuatkan chat baru

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatEvent.loadUsers());
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: _searching
            ? TextField(
                controller: _searchCtrl,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Cari nama...',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  border: InputBorder.none,
                ),
                onChanged: (v) => context
                    .read<ChatBloc>()
                    .add(ChatEvent.loadUsers(search: v)),
              )
            : const Text(
                'Pilih Kontak',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
        actions: [
          IconButton(
            icon: Icon(_searching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() => _searching = !_searching);
              if (!_searching) {
                _searchCtrl.clear();
                context.read<ChatBloc>().add(const ChatEvent.loadUsers());
              }
            },
          ),
        ],
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          state.maybeWhen(
            chatCreated: (chatId) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatDetailPage(
                    chatId: chatId,
                    partnerName: _selectedUser?.name ?? '',
                  ),
                ),
              );
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            ),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: _primary),
            ),
            usersLoaded: (users) =>
                users.isEmpty ? _buildEmpty() : _buildList(users),
            orElse: () => _buildEmpty(),
          );
        },
      ),
    );
  }

  Widget _buildList(List<UserModel> users) {
    // Kelompokkan berdasarkan role
    final superadmins = users.where((u) => u.role == 'superadmin').toList();
    final admins = users.where((u) => u.role == 'admin').toList();
    final others = users
        .where((u) => u.role != 'superadmin' && u.role != 'admin')
        .toList();

    return ListView(
      children: [
        if (superadmins.isNotEmpty) ...[
          _sectionHeader('Super Admin'),
          ...superadmins.map((u) => _userTile(u)),
        ],
        if (admins.isNotEmpty) ...[
          _sectionHeader('Admin'),
          ...admins.map((u) => _userTile(u)),
        ],
        if (others.isNotEmpty) ...[
          _sectionHeader('Pengguna'),
          ...others.map((u) => _userTile(u)),
        ],
      ],
    );
  }

  Widget _sectionHeader(String title) => Container(
        color: _bg,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        child: Text(
          title,
          style: const TextStyle(
            color: _primaryLight,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      );

  Widget _userTile(UserModel user) {
    final roleColor = user.role == 'superadmin'
        ? const Color(0xFF9C27B0)
        : user.role == 'admin'
            ? _primaryLight
            : _textGrey;

    return InkWell(
      onTap: () => _showNewChatSheet(user),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 24,
              backgroundColor: roleColor.withOpacity(0.15),
              child: Text(
                user.initials,
                style: TextStyle(
                  color: roleColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: _textDark,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: roleColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          user.roleLabel,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: roleColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    user.email,
                    style: const TextStyle(
                      fontSize: 12,
                      color: _textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person_search, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 12),
            Text(
              'Tidak ada pengguna ditemukan',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      );

  void _showNewChatSheet(UserModel user) {
    final ctrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: _primary.withOpacity(0.1),
                    child: Text(
                      user.initials,
                      style: const TextStyle(
                          color: _primary, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15)),
                      Text(user.roleLabel,
                          style:
                              const TextStyle(color: _textGrey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: ctrl,
                autofocus: true,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'Tulis pesan pertama...',
                  filled: true,
                  fillColor: _bg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    final msg = ctrl.text.trim();
                    if (msg.isEmpty) return;
                    Navigator.pop(ctx);
                    setState(() => _selectedUser = user); // simpan dulu
                    context.read<ChatBloc>().add(ChatEvent.createChat(
                          receiverId: user.id,
                          message: msg,
                        ));
                  },
                  child: const Text(
                    'Kirim & Buka Chat',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
