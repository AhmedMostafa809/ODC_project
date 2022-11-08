import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


//This screen is details of note
class DetailsOfNoteScreen extends StatelessWidget {

  String? description;
  String? title;
  var date;
  int? noteId;

  DetailsOfNoteScreen({
    required this.noteId,
    required this.description,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
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
            "Your Note",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //Title
              SizedBox(height:10.h),
              Container(
                margin:  const EdgeInsets.only(left:30),
                child: Text(
                  '$title',
                  style: TextStyle(fontSize: 15.sp),
                  // textColor: Colors.black,
                  // fontSize: 15.sp,
                ),
              ),
                         //Date
              Container(
                margin: const EdgeInsets.only(left:30),
                child: Text(
                  '$date',
                ),
              ),

              //Description
              SizedBox(height: 5.h),
              Container(
                margin:  const EdgeInsets.only(left:30),
                child: Text('$description',
                  style: TextStyle(fontSize: 15.sp),
                    // style: TextStyle(
                    //   fontSize: 15.sp,
                    ),
              ),
              // Container(
              //   margin:  EdgeInsets.only(left:30),
              //   child: Text(
              //     '$id',
              //     style: TextStyle(fontSize: 15.sp),
              //     // textColor: Colors.black,
              //     // fontSize: 15.sp,
              //   ),
              // ),


            ],
          ),
        )

    );
  }
}
