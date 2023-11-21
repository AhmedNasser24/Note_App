import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddFormNote extends StatefulWidget {
  const AddFormNote({
    super.key,
  });

  @override
  State<AddFormNote> createState() => _AddFormNoteState();
}

class _AddFormNoteState extends State<AddFormNote> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const Gap(20),
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'field is required';
              } else {
                return null;
              }
            },
          ),
          const Gap(15),
          CustomTextFormField(
            hintText: 'Content',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            onSaved: (value) {
              subtitle = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'field is required';
              } else {
                return null;
              }
            },
          ),
          const Gap(50),
          CustomButton(
            text: 'Add',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                NoteModel newNote = NoteModel(
                    title: title!,
                    subTitle: subtitle!,
                    date: DateTime.now().toString(),
                    color: Colors.blue.value);
                BlocProvider.of<AddNoteCubit>(context)
                    .addNote(newNote: newNote);
              }
            },
            textColor: Colors.black,
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
