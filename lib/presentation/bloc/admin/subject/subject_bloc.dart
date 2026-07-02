import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/subject_datasource.dart';
import 'package:warehouse/data/model/response/admin/subject_response_model.dart';

part 'subject_event.dart';
part 'subject_state.dart';
part 'subject_bloc.freezed.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final SubjectDatasource _datasource;

  SubjectBloc({SubjectDatasource? datasource})
      : _datasource = datasource ?? SubjectDatasource(),
        super(const SubjectState.initial()) {
    on<_LoadSubjects>(_onLoad);
    on<_GetSubjectDetail>(_onDetail);
    on<_CreateSubject>(_onCreate);
    on<_UpdateSubject>(_onUpdate);
    on<_DeleteSubject>(_onDelete);
  }

  Future<void> _onLoad(_LoadSubjects e, Emitter<SubjectState> emit) async {
    emit(const SubjectState.loading());
    final result = await _datasource.getSubjects();
    result.fold(
      (err) => emit(SubjectState.error(err)),
      (subjects) => emit(SubjectState.loaded(subjects)),
    );
  }

  Future<void> _onDetail(_GetSubjectDetail e, Emitter<SubjectState> emit) async {
    emit(const SubjectState.loading());
    final result = await _datasource.getSubjectDetail(e.subjectId);
    result.fold(
      (err) => emit(SubjectState.error(err)),
      (subject) => emit(SubjectState.detailLoaded(subject)),
    );
  }

  Future<void> _onCreate(_CreateSubject e, Emitter<SubjectState> emit) async {
    emit(const SubjectState.loading());
    final result = await _datasource.createSubject(e.data);
    result.fold(
      (err) => emit(SubjectState.error(err)),
      (_) {
        emit(const SubjectState.success('Subject berhasil ditambahkan'));
        add(const SubjectEvent.loadSubjects());
      },
    );
  }

  Future<void> _onUpdate(_UpdateSubject e, Emitter<SubjectState> emit) async {
    emit(const SubjectState.loading());
    final result = await _datasource.updateSubject(e.subjectId, e.data);
    result.fold(
      (err) => emit(SubjectState.error(err)),
      (_) {
        emit(const SubjectState.success('Subject berhasil diupdate'));
        add(const SubjectEvent.loadSubjects());
      },
    );
  }

  Future<void> _onDelete(_DeleteSubject e, Emitter<SubjectState> emit) async {
    emit(const SubjectState.loading());
    final result = await _datasource.deleteSubject(e.subjectId);
    result.fold(
      (err) => emit(SubjectState.error(err)),
      (msg) {
        emit(SubjectState.success(msg));
        add(const SubjectEvent.loadSubjects());
      },
    );
  }
}