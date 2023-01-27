import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Cubits/AddNote/add_note_cubit.dart';
import 'package:noteapp/Models/NotesModel.dart';
import 'package:intl/intl.dart';
import 'Colors.listView.dart';
import 'CustomButton.dart';
import 'CustomTextField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            text: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            text: 'content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorsListView(
            isactive: true,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                ontap: () {
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat('dd-mm-yyyy').format(currentDate);
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var nodemodel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formattedCurrentDate.toString(),
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addnote(nodemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                  ;
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
