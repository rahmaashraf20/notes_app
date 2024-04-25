import 'package:flutter/material.dart';

class Customicon extends StatelessWidget {
  const Customicon({super.key, required this.icon, this.onpressed});
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05)),
      height: 50,
      width: 50,
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(icon),
      ),
    );
  }
}
