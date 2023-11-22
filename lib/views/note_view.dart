import 'package:flutter/material.dart';

import '../widget/add_note_bottom_sheet.dart';

import '../widget/note_app_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  static String id = 'home view id';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true ,
            isScrollControlled: true,
            constraints: BoxConstraints.loose(Size(double.infinity, MediaQuery.of(context).size.height * 5 / 6)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NoteAppBody(),
    );
  }
}
