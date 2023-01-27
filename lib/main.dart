import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Cubits/AddNote/add_note_cubit.dart';
import 'package:noteapp/Cubits/notescubit/notes_cubit.dart';
import 'package:noteapp/Views/NotesView.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/simple_observer.dart';

import 'Models/NotesModel.dart';

void main() async {
  Bloc.observer = SimpleObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotes_Box);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
