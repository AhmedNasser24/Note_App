import 'package:flutter/material.dart';

import 'custom_note_item.dart';

class NoteItemList extends StatelessWidget {
  const NoteItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top:5),
      itemCount: 10,
      itemBuilder: (context, index) => const NoteItem(),
    );
  }
}