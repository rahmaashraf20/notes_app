import 'package:flutter/material.dart';
import 'package:notes_app/const.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key, required this.texthint, this.maxLines = 1, this.onsaved, this.onchanged});
  final String texthint;
  final int maxLines;

  final void Function(String?)? onsaved;
 final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged ,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
          hintText: texthint,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kprimarycolor)),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color ?? Colors.white));
  }
}
