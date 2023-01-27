import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Cubits/notescubit/notes_cubit.dart';
import 'package:noteapp/Models/NotesModel.dart';
import 'package:noteapp/Views/EditNoteView.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return EditNoteView(
            note: note,
          );
        })));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
                subtitle: Text(
                  note.subtitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 18),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchallnotes();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
