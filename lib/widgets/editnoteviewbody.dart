import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/widgets/customappbar.dart';
import 'package:notes_app/widgets/customtextfield.dart';

class Editnoteviewbody extends StatefulWidget {
  const Editnoteviewbody({super.key, required this.note , this.onpressed});
  final Notemodel note;
  final void Function()? onpressed;

  @override
  State<Editnoteviewbody> createState() => _EditnoteviewbodyState();
}

class _EditnoteviewbodyState extends State<Editnoteviewbody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Customappbar(
              onpressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = content ?? widget.note.subtitle;
                widget.note.save();

                BlocProvider.of<NotesCubit>(context).fetchAllnotes();

                Navigator.pop(context);
              },
              title: 'Edit Notes',
              icon: Icons.check),
          const SizedBox(height: 20),
          Customtextfield(
              onchanged: (value) {
                title = value;
              },
              texthint: widget.note.title),
          const SizedBox(height: 16),
          Customtextfield(
            onchanged: (value) {
              content = value;
            },
            texthint: widget.note.subtitle,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
