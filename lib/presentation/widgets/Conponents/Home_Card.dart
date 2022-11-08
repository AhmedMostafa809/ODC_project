import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeCard extends StatelessWidget {
SvgPicture icon;
// SvgPicture iconImage;
String text;
Function() ontap;
   HomeCard(this.icon,this.text,this.ontap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  icon,
                  Text(text,style: const TextStyle(color: Colors.deepOrange,fontSize: 24,fontWeight: FontWeight.bold),),
                ],
              ),
            )
        ),
      ),
    );
  }
}
