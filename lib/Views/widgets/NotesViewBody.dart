import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Cubits/notescubit/notes_cubit.dart';
import 'package:noteapp/Views/widgets/CustomAppBar.dart';
import 'package:noteapp/Views/widgets/CustomCard.dart';
import 'package:noteapp/Views/widgets/NotesCustomList.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchallnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            onpressed: () {},
          ),
          const Expanded(child: NotesCustomList()),
        ],
      ),
    );
  }
}
