import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 40,color: Colors.black),onPressed: (){Navigator.pop(context);}),
        backgroundColor: Colors.white,
        centerTitle: true,

        title: const Text(
          "Sections", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      body: const Center(child: Text("No Sections",style: TextStyle(fontSize: 20),)),
    );
  }
}
