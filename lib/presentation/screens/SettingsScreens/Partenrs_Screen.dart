import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnerScreen extends StatelessWidget {
  const PartnerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 40,color: Colors.black),onPressed: (){Navigator.pop(context);}),

        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Our Partners", style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: _launchURL,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey,
                        Colors.white,
                        Colors.grey,
                      ],
                    ),
                  ),
                  child: Center(
                    child: RichText(
                      text: const TextSpan( text: 'Orange', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange),
                        children: <TextSpan> [
                          TextSpan(text:' Digital', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
                          TextSpan(text:' center', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
                        ],
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


_launchURL() async {
  const url = 'https://www.orangedigitalcenters.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}