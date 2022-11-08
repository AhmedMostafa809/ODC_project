import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Buttons.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Email_txt.dart';
import '../../../../data/data_provider/local/sql_helperl.dart';
import 'Saved_Notes.dart';

class UpdatdNote extends StatelessWidget {
  int targeId;

  UpdatdNote(this.targeId);

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
          "Add Note",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            EmailTxt(
                control: titleUpdateController,
                Action: TextInputAction.next,
                hintTxt: "Note Title",
                keyBoardType: TextInputType.text,
                labelText: "Note Title"),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            TextFormField(
                maxLines: 10,
                cursorHeight: 20,
                controller: contentUpdateController,
                cursorColor: Colors.orange,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Enter your note here",
                  labelText: "Enter your note here",
                  floatingLabelStyle:
                      const TextStyle(color: Colors.orange, fontSize: 15),

                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2)),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(20),
                  //     borderSide: BorderSide(color: Colors.orange)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            Buttons(
                txt: "Update",
                backGroundClr: Colors.deepOrange,
                BorderClr: Colors.transparent,
                ontap: () {
                  SqlHelper.updateDB(
                      targeId,
                      titleUpdateController.text,
                      contentUpdateController.text,
                      DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now()));

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SavedNotes(),
                      ));
                },
                txtClr: Colors.white)
          ],
        ),
      ),
    ));
  }
}

TextEditingController titleUpdateController = TextEditingController();
TextEditingController contentUpdateController = TextEditingController();
