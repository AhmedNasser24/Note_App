import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/note/fetch_and_delete_note_cubit.dart';
import 'package:note_app/views/note_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/select_color/select_color_cubit.dart';
import 'models/note_model.dart';
import 'simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectColorCubit()),
        BlocProvider(create: (context) => FetchAndDeleteNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        routes: {
          NoteView.id: (context) => const NoteView(),
        },
        initialRoute: NoteView.id,
      ),
    );
  }
}
