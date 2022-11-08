import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_day_one/constants/Images.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Midterms_Card.dart';

class MidtermScreen extends StatefulWidget {
  const MidtermScreen({Key? key}) : super(key: key);

  @override
  _MidtermScreenState createState() => _MidtermScreenState();
}

class _MidtermScreenState extends State<MidtermScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 40,color: Colors.black),onPressed: (){Navigator.pop(context);}),
              backgroundColor: Colors.white,
              centerTitle: true,
              actions: [
                SvgPicture.asset(Img.filterImage,color: Colors.deepOrange,height: 30,)
              ],
              title: const Text(
                "Midterms", style: TextStyle(color: Colors.black, fontSize: 30),),
            ),
            body:ListView(children:  [
              MidtermsCard(),
              MidtermsCard(),
              MidtermsCard(),
              MidtermsCard(),



            ],)
        )
    );
  }
}
