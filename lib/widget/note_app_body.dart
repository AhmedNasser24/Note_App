import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

import 'package:gap/gap.dart';

import 'note_item_list.dart';

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
          Gap(40),
          CustomAppBar(title: 'Note' , icon: Icons.search,),
          Expanded(child: NoteItemList()),
        ],
      ),
    );
  }
}
