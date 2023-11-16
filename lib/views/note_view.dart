import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/custom_button.dart';
import '../widget/custom_text_form_field.dart';
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

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            CustomTextFormField(onChanged: (data) {}, hintText: 'Title'),
            const Gap(15),
            CustomTextFormField(onChanged: (data) {}, hintText: 'Content',
            contentPadding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 50),
            
            ),
            const Gap(50) ,
            CustomButton(text: 'Add', onTap: (){} , textColor: Colors.black,) ,
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
