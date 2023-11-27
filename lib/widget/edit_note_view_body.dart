import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/note/fetch_and_delete_note_cubit.dart';
import 'package:note_app/cubits/select_color/select_color_cubit.dart';
import 'package:note_app/widget/custom_app_bar.dart';
import 'package:note_app/widget/list_color_item.dart';
import 'package:note_app/widget/show_snack_bar.dart';

import '../models/note_model.dart';
import 'custom_text_form_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the initial value from widget.note.title
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                int selectedColor =
                    BlocProvider.of<SelectColorCubit>(context).colorItemIndex;
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.color = selectedColor != -1
                    ? kColorsList[selectedColor].value
                    : widget.note.color;
                widget.note.save();
                BlocProvider.of<FetchAndDeleteNoteCubit>(context)
                    .fetchAllNotes();
                showSnackBar(context, 'Saved', color: kPrimaryColor);
                Navigator.pop(context);
              },
            ),
            const Gap(20),
            const Text(
              'Title',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const Gap(2),
            CustomTextFormField(
              controller: titleController,
              onChanged: (value) {
                title = value;
              },
              hintText: widget.note.title,
              maxLines: 1,
            ),
            const Gap(20),
            const Text(
              'Content',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const Gap(2),
            CustomTextFormField(
              controller: contentController,
              onChanged: (value) {
                content = value;
              },
              hintText: widget.note.content,
              maxLines: 5,
            ),
            const ListColorItem()
          ],
        ),
      ),
    );
  }
}
