import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/widgets/customappbar.dart';
import 'package:notes_app/widgets/customicon.dart';
import 'package:notes_app/widgets/customitem.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class Noteviewbody extends StatefulWidget {
  const Noteviewbody({super.key});

  @override
  State<Noteviewbody> createState() => _NoteviewbodyState();
}

class _NoteviewbodyState extends State<Noteviewbody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            Customappbar(
              title: 'Notes',
              icon: Icons.search,
            ),
            Expanded(child: Noteslistview())
          ],
        ),
      ),
    );
  }
}
