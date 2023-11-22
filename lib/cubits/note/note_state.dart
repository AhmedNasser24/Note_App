part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {}

class NoteFailure extends NoteState {
  final String errMessage;

  NoteFailure(this.errMessage);
}
