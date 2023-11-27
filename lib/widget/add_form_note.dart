import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/note/fetch_and_delete_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/show_snack_bar.dart';

import '../constant.dart';
import '../cubits/select_color/select_color_cubit.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';
import 'list_color_item.dart';

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
  int selectedColor = -1;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
          const ListColorItem(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                text: 'Add',
                onTap: () async {
                  selectedColor = BlocProvider.of<SelectColorCubit>(context)
                      .colorItemIndex;
                  
                  if (formKey.currentState!.validate()) {
                    await addNote(context);
                  }
                  else if (autovalidateMode != AutovalidateMode.always) {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                textColor: Colors.black,
              );
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Future<void> addNote(BuildContext context) async {
    formKey.currentState!.save();
    DateTime dateTime = DateTime.now();
    String dateNow = DateFormat('dd/MM/yyyy').format(dateTime);
    NoteModel newNote = NoteModel(
      title: title!,
      content: subtitle!,
      date: dateNow,
      color: kColorsList[selectedColor].value,
    );
    await BlocProvider.of<AddNoteCubit>(context).addNote(newNote: newNote);
  }
}
