import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'note_item.dart';
import 'package:gap/gap.dart';

class NoteAppBody extends StatelessWidget {
  const NoteAppBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: const [
          Gap(30),
          CustomAppBar(),
          Gap(15),
          NoteItem(),
        ],
      ),
    );
  }
}
