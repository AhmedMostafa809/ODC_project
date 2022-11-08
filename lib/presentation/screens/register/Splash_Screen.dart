import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),)));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
            "https://media.licdn.com/dms/image/C4E0BAQG2RX0NCCe26A/company-logo_200_200/0/1637923169202?e=1675296000&v=beta&t=M0hopBawtPnHJk3cXjj4gmRW8MwYSzU2MSmRt7yOyc4"),
      ),
    );
  }
}
