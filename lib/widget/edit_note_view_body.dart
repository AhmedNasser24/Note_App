import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/widget/custom_app_bar.dart';

import 'custom_text_form_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Gap(30),
            CustomAppBar(title: 'Edit Note', icon: Icons.check),
            Gap(20),
            CustomTextFormField(
              hintText: 'title',
              maxLines: 1,
            ),
            Gap(20),
            CustomTextFormField(
              hintText: 'content',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
