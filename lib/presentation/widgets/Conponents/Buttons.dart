import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
class Buttons extends StatelessWidget {
  final String txt;
  final Function() ontap;
  final Color backGroundClr,txtClr,BorderClr;
  Buttons({required this.txt,required this.backGroundClr,required this.BorderClr,required this.ontap,required this.txtClr});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 7.5.h,
        decoration: BoxDecoration(
            color: backGroundClr,
            border: Border.all(width: 2,color: BorderClr),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(txt
            ,style: TextStyle(fontSize: 24,color: txtClr,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
