import 'package:flutter/material.dart';
import 'package:notes_app/const.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, this.ontap,  this.isLoding = false});

  final void Function()? ontap;
 final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: kprimarycolor, borderRadius: BorderRadius.circular(9)),
        child:  Center(
          child:isLoding ? CircularProgressIndicator()  : Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
