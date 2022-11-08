import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:odc_day_one/presentation/screens/NotesApp/SettingsScreens/FAQ_Screen.dart';
// import 'package:odc_day_one/presentation/screens/NotesApp/SettingsScreens/Partenrs_Screen.dart';
// import 'package:odc_day_one/presentation/screens/NotesApp/SettingsScreens/Support_Screen.dart';
// import 'package:odc_day_one/presentation/screens/NotesApp/SettingsScreens/Terms&Conditions_Screen.dart';
import 'package:odc_day_one/presentation/screens/register/Login.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/ListTileWidget.dart';

import '../screens/SettingsScreens/FAQ_Screen.dart';
import '../screens/SettingsScreens/Partenrs_Screen.dart';
import '../screens/SettingsScreens/Support_Screen.dart';
import '../screens/SettingsScreens/Terms&Conditions_Screen.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: ListView(children: [
        LisTileWidget(
            text: "FAQ",
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FAQScreen(),
                  ));
            }),
        LisTileWidget(
            text: "Terms & Conditions",
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndConditonsScreen(),
                  ));
            }),
        LisTileWidget(text: "Our Partners", ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PartnerScreen(),
              ));

        }),
        LisTileWidget(text: "Support", ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SupportScreen(),
              ));

        }),
        LisTileWidget(
            text: "Log out",
            ontap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: const Text("Log Out"),
                      content: Container(
                        height: MediaQuery.of(context).size.height * .15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Are you sure?"),
                            Row(
                              children: [
                                Expanded(
                                    child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  color: Colors.deepOrange,
                                  child: const Text("Cancel",
                                      style: TextStyle(color: Colors.white)),
                                )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .03,
                                ),
                                Expanded(
                                    child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Login(),
                                        ),
                                        (route) => false);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 3, color: Colors.deepOrange),
                                  ),
                                  child: const Text("Log Out",
                                      style:
                                          TextStyle(color: Colors.deepOrange)),
                                ))
                              ],
                            )
                          ],
                        ),
                      ));
                },
              );
            }),
      ]),
    );
  }
}
