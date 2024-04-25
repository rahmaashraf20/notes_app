import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customicon.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key, required this.title, required this.icon, this.onpressed});
  final String title;
  final IconData icon;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: const TextStyle(fontSize: 32),
      ),
      Spacer(),
      Customicon(
        onpressed: onpressed,
        icon: icon),
    ]);
  }
}
