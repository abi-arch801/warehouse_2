import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/core/constant/reverb_service.dart';
import 'package:warehouse/data/datasource/shared/chat_remote_datasource.dart';
import 'package:warehouse/data/model/response/auth/auth_response_model.dart';
import 'package:warehouse/data/model/response/shared/chat_response_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRemoteDatasource _ds;
  final ReverbService _reverb;
  StreamSubscription<ChatMessageModel>? _realtimeSub;
  int? _activeChatId;

  ChatBloc({
    ChatRemoteDatasource? datasource,
    ReverbService? reverbService,
  })  : _ds = datasource ?? ChatRemoteDatasource(),
        _reverb = reverbService ?? ReverbService(),
        super(const ChatState.initial()) {
    on<_LoadUsers>(_onLoadUsers);
    on<_LoadChats>(_onLoadChats);
    on<_LoadDetail>(_onLoadDetail);
    on<_SendMessage>(_onSendMessage);
    on<_CreateChat>(_onCreateChat);
    on<_MarkAsRead>(_onMarkAsRead);
    on<_NewRealtimeMessage>(_onNewRealtimeMessage);
    on<_DisconnectRealtime>(_onDisconnect);
  }

  // ── Load daftar user ──────────────────────────────────────────────────────
  Future<void> _onLoadUsers(_LoadUsers e, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    final res = await _ds.getUsers(search: e.search);
    res.fold(
      (l) => emit(ChatState.error(l)),
      (r) => emit(ChatState.usersLoaded(r.data)),
    );
  }

  // ── Load daftar chat ──────────────────────────────────────────────────────
  Future<void> _onLoadChats(_LoadChats e, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    final res = await _ds.getChats();
    res.fold(
      (l) => emit(ChatState.error(l)),
      (r) => emit(ChatState.chatsLoaded(r.data)),
    );
  }

  // ── Load detail chat + subscribe Reverb ──────────────────────────────────
  // Future<void> _onLoadDetail(_LoadDetail e, Emitter<ChatState> emit) async {
  //   emit(const ChatState.loading());

  //   // Inisialisasi Reverb kalau belum
  //   await _reverb.connect();

  //   final res = await _ds.getChatDetail(e.chatId);
  //   res.fold(
  //     (l) => emit(ChatState.error(l)),
  //     (r) {
  //       if (r.data == null) {
  //         emit(const ChatState.error('Gagal memuat detail chat.'));
  //         return;
  //       }
  //       emit(ChatState.detailLoaded(
  //         chat: r.data!.chat,
  //         messages: r.data!.messages,
  //       ));

  //       // Mark as read otomatis
  //       _ds.markAsRead(e.chatId);

  //       // Subscribe ke Reverb untuk pesan realtime
  //       _activeChatId = e.chatId;
  //       _realtimeSub?.cancel();
  //       _realtimeSub = _reverb.subscribeToChat(e.chatId).listen((msg) {
  //         add(ChatEvent.newRealtimeMessage(msg));
  //       });
  //     },
  //   );
  // }

  // ── Kirim pesan ───────────────────────────────────────────────────────────
  Future<void> _onSendMessage(_SendMessage e, Emitter<ChatState> emit) async {
    final res = await _ds.sendMessage(
      chatId: e.chatId,
      message: e.message,
    );
    res.fold(
      (l) => emit(ChatState.error(l)),
      (r) {
        if (r.sentMessage != null) {
          emit(ChatState.messageSent(r.sentMessage!));
        }
      },
    );
  }

  // ── Buat chat baru ────────────────────────────────────────────────────────
  Future<void> _onCreateChat(_CreateChat e, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    final res = await _ds.createChat(
      receiverId: e.receiverId,
      message: e.message,
    );
    res.fold(
      (l) => emit(ChatState.error(l)),
      (r) {
        final chatId = r.chatId ?? r.sentMessage?.chatId ?? 0;
        emit(ChatState.chatCreated(chatId));
      },
    );
  }

  // ── Mark as read ──────────────────────────────────────────────────────────
  Future<void> _onMarkAsRead(_MarkAsRead e, Emitter<ChatState> emit) async {
    await _ds.markAsRead(e.chatId);
    emit(const ChatState.markedAsRead());
  }

  // ── Pesan realtime masuk dari Reverb ──────────────────────────────────────
  Future<void> _onNewRealtimeMessage(
      _NewRealtimeMessage e, Emitter<ChatState> emit) async {
    emit(ChatState.realtimeMessage(e.message));
  }

  // ── Disconnect ────────────────────────────────────────────────────────────
  Future<void> _onDisconnect(
      _DisconnectRealtime e, Emitter<ChatState> emit) async {
    _realtimeSub?.cancel();
    if (_activeChatId != null) {
      _reverb.unsubscribeFromChat(_activeChatId!);
    }
  }

  Future<void> _onLoadDetail(_LoadDetail e, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    await _reverb.connect(); // atau connect()
    final res = await _ds.getChatDetail(e.chatId);
    res.fold(
      (l) => emit(ChatState.error(l)),
      (r) {
        emit(ChatState.detailLoaded(
          chat: r.data!.chat,
          messages: r.data!.messages,
        ));
        _ds.markAsRead(e.chatId);
        _activeChatId = e.chatId;
        _realtimeSub = _reverb.subscribeToChat(e.chatId).listen((msg) {
          add(ChatEvent.newRealtimeMessage(msg));
        });
      },
    );
  }

  @override
  Future<void> close() {
    _realtimeSub?.cancel();
    return super.close();
  }
}
