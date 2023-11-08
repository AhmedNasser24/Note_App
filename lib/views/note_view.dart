import 'package:flutter/material.dart';

import '../widget/note_app_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  static String id = 'home view id';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteAppBody(),
    );
  }
}
