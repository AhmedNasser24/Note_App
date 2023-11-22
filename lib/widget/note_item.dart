import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/cubits/note/note_cubit.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/models/note_model.dart' ;
class NoteItem extends StatelessWidget {
  const NoteItem({super.key , required this.note, required this.index});
  final NoteModel note ;
  final int index ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EditNoteView(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 30),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 28, color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {
                    BlocProvider.of<FetchAndDeleteNoteCubit>(context).deleteNote(index) ;
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 40,
                  )),
              subtitle:  Text(
                note.subTitle,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            const Gap(15),
            const Text(
              'May 21 , 2023',
              style: TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
