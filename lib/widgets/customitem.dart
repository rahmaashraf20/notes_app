

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/widgets/editnoteview.dart';
import 'package:share_plus/share_plus.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.note});
  final Notemodel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  Editnoteview(
            note: note,
            
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style:const TextStyle(color: Colors.black, fontSize: 30),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 20),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllnotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
           const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
