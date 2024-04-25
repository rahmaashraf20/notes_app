import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/const.dart';
import 'package:notes_app/models/notemodel.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesCubitInitial());

  List<Notemodel>? notes;

  fetchAllnotes() async {
    var notebox = Hive.box<Notemodel>(knotebox);

    notes = notebox.values.toList();
    emit(NotesSuccess());
  }
}
