import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/show_snack_bar.dart';

import 'custom_note_item.dart';

class NoteItemList extends StatelessWidget {
  const NoteItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notesList = NoteCubit().notesList;
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if ( state is NoteFailure ) {
          showSnackBar(context, state.errMessage) ;
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          itemCount: notesList.length,
          itemBuilder: (context, index) =>  NoteItem(note: notesList[index]),
        );
      },
    );
  }
}
