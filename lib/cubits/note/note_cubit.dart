import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial()){
    fetchAllNotes() ;
  }
  List<NoteModel> notesList = [] ;
  fetchAllNotes() {
    try {
      Box<NoteModel> notes = Hive.box<NoteModel>(kNotesBox);
      notesList = notes.values.toList();
      emit(NoteSuccess());
    } catch (e) {
      emit(NoteFailure(e.toString())) ;
    }
  }
}
