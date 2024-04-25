import 'package:flutter/material.dart';
import 'package:notes_app/models/notemodel.dart';
import 'editnoteviewbody.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key, required this.note});
  final Notemodel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Editnoteviewbody(
        note: note,
      ),
    );
  }
}
