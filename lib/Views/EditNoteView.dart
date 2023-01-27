import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noteapp/Models/NotesModel.dart';
import 'package:noteapp/Views/widgets/BodyEditNoteView.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyEditNoteView(
        note: note,
      ),
    );
  }
}
