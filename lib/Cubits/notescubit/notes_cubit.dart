import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../Models/NotesModel.dart';
import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchallnotes() {
    var notesbox = Hive.box<NoteModel>(kNotes_Box);
    notes = notesbox.values.toList();
    emit(NoteSuccess());
  }
}
