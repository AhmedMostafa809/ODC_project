import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_day_one/constants/Images.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/CalenderScreen.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/Finals.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/Lectures.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/MidtermScreen.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/NotesApp/Saved_Notes.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/Sections.dart';
// import 'package:odc_day_one/presentation/screens/NotesApp/Notes.dart';
import '../screens/Home_screens_director/NotesApp/Notes.dart';
import '../widgets/Conponents/Home_Card.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  List<SvgPicture>iconsList = [
    SvgPicture.asset(Img.lectureImage, height:50),
    SvgPicture.asset(Img.sectionsImage, height:50,color: Colors.deepOrange,),
    SvgPicture.asset(Img.midtermImage, height:50),
    SvgPicture.asset(Img.finalImage, height:50),
    SvgPicture.asset(Img.eventImage, height:50),
    SvgPicture.asset(Img.notesImage, height:50),
  ];
  List<String> txtList = [
    "Lectures",
    "Sections",
    "Midterms",
    "Finals",
    "Events",
    "Notes",
  ];
  List<Widget> screens = [
    LecturesScreen(),
    SectionsScreen(),
    MidtermScreen(),
    finalsScreen(),
    CalenderScreen(),
    SavedNotes()
  ];

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Orange ",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange)),
            Text("Digital Center",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),
        Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 50),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 140),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return HomeCard(
                    iconsList[index],
                    txtList[index],
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screens[index],
                        )),
                  );
                }))
      ],
    )));
  }
}
