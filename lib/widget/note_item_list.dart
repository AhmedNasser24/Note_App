import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/note/fetch_and_delete_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/show_snack_bar.dart';

import 'note_item.dart';

class NoteItemList extends StatelessWidget {
  const NoteItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<FetchAndDeleteNoteCubit, NoteState>(
      builder: (context, state) {
        
        List<NoteModel> notesList = BlocProvider.of<FetchAndDeleteNoteCubit>(context).notesList;
        return ModalProgressHUD(
          inAsyncCall: state is NoteLoading ? true : false,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 5),
            itemCount: notesList.length,
            itemBuilder: (context, index) =>  NoteItem(note: notesList[index] , index: index,),
          ),
        );
      },
    );
  }
}
