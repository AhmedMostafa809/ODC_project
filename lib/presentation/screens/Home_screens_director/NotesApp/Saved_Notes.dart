import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/NotesApp/Updated_note.dart';
import 'package:sizer/sizer.dart';
import '../../../../data/data_provider/local/sql_helperl.dart';
import '../../../widgets/Conponents/Notes_card.dart';
import '../../Home.dart';
import 'Notes.dart';

class SavedNotes extends StatefulWidget {
  const SavedNotes({Key? key}) : super(key: key);

  @override
  _SavedNotesState createState() => _SavedNotesState();
}

class _SavedNotesState extends State<SavedNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_sharp,
                size: 40, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Your notes",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder(
          future: SqlHelper.getAllRowsDB(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return const Center(
                    child: Text(
                  "There's No Data To Show",
                ));
              }

              //if there's  data in the list of notes
              else {
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),

                      //list of notes
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return DetailsOfNoteScreen(
                              noteId: snapshot.data[index].id,
                              title: snapshot.data[index].title,
                              date: snapshot.data[index].date,
                              description: snapshot.data[index].description,
                            );
                          }));
                        },

                        //title of note
                        title: Text("${snapshot.data[index].title}",
                            style: TextStyle(fontSize: 20.sp)
                            // fontSize: 20.sp,
                            // textColor: Colors.black,
                            ),

                        //date of note
                        subtitle: Text(
                          "${snapshot.data[index].date}",
                          // style: TextStyle(fontSize: 15.sp)
                          // fontSize: 20.sp,
                          // textColor: Colors.black,
                        ),

                        //btn edit + btn delete
                        trailing: Wrap(
                          children: [
                            //btn edit
                            IconButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdatdNote(snapshot.data[index].id),
                                    ));
                                // Navigator.popAndPushNamed(context, '/details');
                                //
                                //

                                // SqlHelper.updateDB(
                                //     snapshot.data[index].id,
                                //     snapshot.data[index].title,
                                //     snapshot.data[index].description,
                                //     snapshot.data[index].date);
                                //  Navigator.pop(context);
                                titleUpdateController.clear();
                                contentUpdateController.clear();
                              },

                              icon: const Icon(Icons.edit,color: Colors.deepOrange,),
                              iconSize: 15.sp,
                              // color: AppColors.primaryColor,
                            ),

                            //btn delete
                            IconButton(
                              onPressed: () {
                                setState(() {});
                                SqlHelper.deleteDB(snapshot.data[index].id);
                              },
                              icon: const Icon(Icons.delete,color: Colors.deepOrange,),
                              iconSize: 15.sp,
                              // color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          titleController.clear();
          contentController.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const NotesScreen();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
//SafeArea(
//       child: Scaffold(

//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => NotesScreen(),
//                   ));
//               // titleControl.clear();
//               // txtControl.clear();
//             },
//             backgroundColor: Colors.deepOrange,
//             child: Icon(Icons.add_outlined),
//           ),
//           body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             elevation: 10,
//             child: InkWell(
//               child: Container(
//                 height: MediaQuery.of(context).size.height%200,
//                 width: double.infinity,
//                 // decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(40), ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 30),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "Note 1",
//                               style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "11:25",
//                               style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "1/11",
//                               style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 // db.updateDB(titleControl.text, txtControl.text);
//                                 // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Notes(),));
//                               },
//                               icon: Icon(Icons.edit,color: Colors.deepOrange,)),
//                           IconButton(
//                               onPressed: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                       content: Container(
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 0.2,
//                                         child: Column(
//                                           children: [
//                                             const Text(
//                                               "Are you sure that note will be deleted from your phone",
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                               ),
//                                             ),
//                                             const Spacer(),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: [
//                                                 MaterialButton(
//                                                   onPressed: () {},
//                                                   height: 35,
//                                                   color: Colors.orange,
//                                                   child: const Text('Delete'),
//                                                 ),
//                                                 MaterialButton(
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                     // DB.deleteDB();
//                                                   },
//                                                   height: 35,
//                                                   color: Colors.orange,
//                                                   child: const Text('Cancel'),
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                               icon: Icon(Icons.delete,color: Colors.deepOrange)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
