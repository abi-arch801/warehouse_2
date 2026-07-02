part of 'subject_bloc.dart';

@freezed
class SubjectState with _$SubjectState {
  const factory SubjectState.initial() = _Initial;
  const factory SubjectState.loading() = _Loading;
  const factory SubjectState.loaded(List<SubjectModel> subjects) = _Loaded;
  const factory SubjectState.detailLoaded(SubjectModel subject) = _DetailLoaded;
  const factory SubjectState.success(String message) = _Success;
  const factory SubjectState.error(String message) = _Error;
}