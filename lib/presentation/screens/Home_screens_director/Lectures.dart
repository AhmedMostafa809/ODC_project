import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 40,color: Colors.black),onPressed: (){Navigator.pop(context);}),
        backgroundColor: Colors.white,
        centerTitle: true,

        title: const Text(
          "Lectures", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      body: const Center(child: Text("No Lectures",style: TextStyle(fontSize: 20),)),
    );
  }
}
