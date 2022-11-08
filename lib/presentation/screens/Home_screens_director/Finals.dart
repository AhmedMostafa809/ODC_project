import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/Images.dart';

class finalsScreen extends StatelessWidget {
  const finalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset(Img.filterImage,color: Colors.deepOrange,height: 30,)
        ],
        leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 40,color: Colors.black),onPressed: (){Navigator.pop(context);}),
        backgroundColor: Colors.white,
        centerTitle: true,

        title: const Text(
          "Finals", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      body: const Center(child: Text("No exams",style: TextStyle(fontSize: 20),)),
    );
  }
}
