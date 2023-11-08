import 'package:flutter/material.dart';
import 'package:note_app/views/note_view.dart';

void main() {
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