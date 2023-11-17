import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/views/note_view.dart';

void main()async {
  await Hive.initFlutter();
  var box = await Hive.openBox(kNotesBox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins' ,
      ),
      
      routes: {
        NoteView.id : (context) => const NoteView() ,
      },
      initialRoute: NoteView.id ,
    );
  }
}
