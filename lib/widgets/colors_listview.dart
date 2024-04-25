import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class Coloritem extends StatelessWidget {
  const Coloritem({super.key, required this.isActive, required this.color});

  final bool isActive;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 34,
            backgroundColor: color,
          );
  }
}

class Colorlistview extends StatefulWidget {
  const Colorlistview({super.key});

  @override
  State<Colorlistview> createState() => _ColorlistviewState();
}

class _ColorlistviewState extends State<Colorlistview> {
  List<Color> avatarcolors = const [
    Color(0xffDCFFFD),
    Color(0xff52FFEE),
    Color(0xff4FB477),
    Color(0xff3F6634),
    Color(0xff345511),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: avatarcolors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;

                  BlocProvider.of<AddNoteCubit>(context).color =
                      avatarcolors[index];
                  setState(() {});
                },
                child: Coloritem(
                  color: avatarcolors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
