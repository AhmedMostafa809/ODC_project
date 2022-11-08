import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditonsScreen extends StatelessWidget {
  const TermsAndConditonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_sharp,
                size: 40, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Terms&Conditions",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Why do we use it?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            )),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text("It is a long established fact "
                    "that a reader will be distracted by "
                    "the readable content of a page when looking at its layout."
                    " The point of using Lorem Ipsum is that it has a more-or-less normal distribution "
                    "of letters, as opposed to using 'Content here, content here', making it look like readable"
                    " English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default"
                    " model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various"
                    " versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour"
                    " and the like).")),
          )
        ],
      ),
    ));
  }
}
