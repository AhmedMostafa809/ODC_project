import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  // bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    // bool _customTileExpanded = false;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 40,color: Colors.black),onPressed: (){Navigator.pop(context);}),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "FAQ",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        body: ListView(
          children: [

            Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
            ),
              elevation: 10,
              child: const ExpansionTile(
                title: Text('Q1:How many countries Orange Digital center is in?'),
                textColor: Colors.black87,
                iconColor: Colors.black87,
                trailing: Icon(
                  Icons.keyboard_arrow_down
                ),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("16 country"),
                  )

                  // ListTile(title: Text('This is tile number 2')),
                ],
                // onExpansionChanged: (bool expanded) {
                //   setState(() => _customTileExpanded = expanded);
                // },
              ),
          ),
            ),]
        ),
      ),
    );
  }
}
