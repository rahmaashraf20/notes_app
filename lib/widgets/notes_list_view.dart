import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/widgets/customitem.dart';

class Noteslistview extends StatefulWidget {
  const Noteslistview({super.key});
 

  @override
  State<Noteslistview> createState() => _NoteslistviewState();
}

class _NoteslistviewState extends State<Noteslistview> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<Notemodel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final note = notes[index];

                return Dismissible(
                  
                  key: ValueKey<Notemodel>(note),
                  onDismissed: (direction) {
                    
                   
                    
                    
                    setState(() {
                      notes.removeAt(index);
                     
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('dissmised')));
                  },
                  background: Container(
                    color: Colors.red,
                    child:const Icon(Icons.delete),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomItem(
                      note: notes[index],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
