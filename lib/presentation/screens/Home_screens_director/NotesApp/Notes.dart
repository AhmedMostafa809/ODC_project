import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odc_day_one/presentation/screens/Home.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Buttons.dart';
import 'package:odc_day_one/presentation/widgets/Conponents/Email_txt.dart';
import 'package:odc_day_one/data/Models/notes_model.dart';
import '../../../../data/data_provider/local/sql_helperl.dart';
import 'Saved_Notes.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_sharp,
                size: 40, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomeScreen(),));
            }),
        backgroundColor: Colors.white,
        centerTitle: true,

        title: const Text(
          "Add Note", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children:  [
            EmailTxt(control: titleController, Action: TextInputAction.next, hintTxt: "Note Title", keyBoardType: TextInputType.text, labelText: "Note Title"),
            SizedBox(height: MediaQuery.of(context).size.height*.07,),
            TextFormField(
              maxLines: 10,
                cursorHeight: 20,
                controller: contentController,
                cursorColor: Colors.orange,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Enter your note here",
                  labelText: "Enter your note here",
                  floatingLabelStyle: const TextStyle(color: Colors.orange, fontSize: 15),

                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black12,width: 2)),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(20),
                  //     borderSide: BorderSide(color: Colors.orange)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical:20 ),
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.07,),
            Buttons(txt: "Add", backGroundClr: Colors.deepOrange, BorderClr: Colors.transparent, ontap: (){

              SqlHelper.insertDB({
                'Description': contentController.text,
                'Title': titleController.text,
                'date': DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now()),
              });
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SavedNotes(),));
            },


                txtClr: Colors.white)
          ],
        ),
      ),
    ));
  }
}
int? id;
String? title;
String? description;
// String? date;
//
// String datetime = DateFormat("hh:mm:ss a      dd/MM/yyyy").format(DateTime.now());


TextEditingController titleController = TextEditingController();
TextEditingController contentController = TextEditingController();
