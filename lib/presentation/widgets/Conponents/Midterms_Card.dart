import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_day_one/constants/Images.dart';
import 'package:sizer/sizer.dart';

class MidtermsCard extends StatelessWidget {
  const MidtermsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10,
          child: InkWell(
            child: SizedBox(
              height: 70.sp,
              width: double.infinity,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(40), ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Midterm",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.timer,
                              size: 17,
                            ),
                            Text("22hrs")
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Exam Date",style: TextStyle(color: Colors.grey),),
                            Row(
                              children: [
                                SvgPicture.asset(Img.eventImage,color: Colors.black87,),
                                const Text("2022-11-1")
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Start time",style: TextStyle(color: Colors.grey),),  Row(

                              children: [
                                SvgPicture.asset(Img.timeImage,color: Colors.greenAccent,),
                                const Text("12:00pm")
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("End time",style: TextStyle(color: Colors.grey),), Row(
                              children: [
                                SvgPicture.asset(Img.timeImage,color: Colors.redAccent,),

                                const Text("2:00pm")                            ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}




