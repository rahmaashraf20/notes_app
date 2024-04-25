import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/widgets/colors_listview.dart';
import 'package:notes_app/widgets/custombutton.dart';
import 'package:notes_app/widgets/customtextfield.dart';

class Addnoteform extends StatefulWidget {
  const Addnoteform({
    super.key,
  });

  @override
  State<Addnoteform> createState() => _AddnoteformState();
}

class _AddnoteformState extends State<Addnoteform> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Customtextfield(
            onsaved: (value) {
              title = value;
            },
            texthint: 'title',
          ),
          const SizedBox(height: 16),
          Customtextfield(
            onsaved: (value) {
              subtitle = value;
            },
            texthint: 'content',
            maxLines: 5,
          ),
          const SizedBox(height: 32),
        const Padding(
           padding:  EdgeInsets.only(bottom: 16),
           child: Colorlistview(),
         ),

          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return Custombutton(
                isLoding: state is AddNoteLoading ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentDate = DateTime.now();

                    var formatCurrentDate =
                        DateFormat('dd-mm-yyyy').format(currentDate);
                    var noteModel = Notemodel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatCurrentDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addnote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );

              
            },
          )
        ],
      ),
    );
  }
}


