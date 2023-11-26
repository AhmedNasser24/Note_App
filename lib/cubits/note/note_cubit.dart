import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/note_model.dart';

part 'note_state.dart';

class FetchAndDeleteNoteCubit extends Cubit<NoteState> {
  FetchAndDeleteNoteCubit() : super(NoteInitial()) {
    fetchAllNotes();
  }
  List<NoteModel> notesList = [];
  void fetchAllNotes() {
    Box<NoteModel> notes = Hive.box<NoteModel>(kNotesBox);
    notesList = notes.values.toList();
    emit(NoteSuccess()) ;
  }

  Future <void> deleteNote(int index) async {
    emit(NoteLoading());
    try {
      Box<NoteModel> notes = Hive.box(kNotesBox);
      
      await notes.deleteAt(index);
      notesList = notes.values.toList();
      emit(NoteSuccess());
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
