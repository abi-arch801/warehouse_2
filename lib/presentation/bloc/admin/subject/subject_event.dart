part of 'subject_bloc.dart';

@freezed
class SubjectEvent with _$SubjectEvent {
  const factory SubjectEvent.loadSubjects() = _LoadSubjects;
  const factory SubjectEvent.getSubjectDetail(String subjectId) = _GetSubjectDetail;
  const factory SubjectEvent.createSubject(Map<String, dynamic> data) = _CreateSubject;
  const factory SubjectEvent.updateSubject({
    required String subjectId,
    required Map<String, dynamic> data,
  }) = _UpdateSubject;
  const factory SubjectEvent.deleteSubject(String subjectId) = _DeleteSubject;
}