//void _createEventScreen(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       String title = '';
//       String date;
//       String description = '';
//       return AlertDialog(
//         title: Text('Create a New Event'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Title',
//                 ),
//                 onChanged: (value) {
//                   title = value;
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Date',
//                 ),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   date = value;
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Description',
//                 ),
//                 onChanged: (value) {
//                   description = value;
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Do something with the entered details
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//           ],
//       );
//     },
//   );
// }
//
// class EventsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             color: Colors.lightBlue[100],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                   SizedBox(height: 70),
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundImage: AssetImage('../logo.jpg'),
//                   ),
//                   SizedBox(height: 30, width: 20,),
//                   Text("Events",
//                     style: TextStyle(fontSize: 20),),
//                 ]
//                 ),
//
//                 SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: InkWell(
//                     onTap: () {
//                       _createEventScreen(context);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue,
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//
//             ),
//           ),
//           SizedBox(height: 30),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(20),
//               children: [
//                 Card(
//                   child: ListTile(
//                     title: Text('Item 1'),
//                     subtitle: Text('Description of item 1'),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Item 2'),
//                     subtitle: Text('Description of item 2'),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Item 3'),
//                     subtitle: Text('Description of item 3'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => EventsApp()),
//                   );
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../events.jpg'),
//                         width: 40,
//                         height: 40),
//                     Text("Events"),
//
//                   ],),),
//
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => QuestionsAndAnswersApp()),
//                   );
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../ask.jpg'),
//                         width: 40,
//                         height: 40),
//                     Text("Q&A"),
//
//                   ],),),
//
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DiseasesApp()),
//                   );
//                   // Navigate to Diseases page
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../answer.jpg'),
//                         width: 40,
//                         height: 40),
//                     Text("Information"),
//
//                   ],),),
//
//               GestureDetector(
//                 onTap: () {
//                   Profile(context);
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../profile.JPG'),
//                         width: 40,
//                         height: 40),
//                     Text("Profile"),
//
//                   ],),),
//
//
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
// }




//import 'package:flutter/material.dart';
// import 'package:untitled1/events/ui/events.dart';
//
// class NewEvents extends StatefulWidget{
//   const NewEvents({super.key});
//
//   State<NewEvents> createState() => _NewEventState();
//
// }
//
// class _NewEventState extends State<NewEvents>{
//   List<Events> events = [];
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   String title = "";
//   String date = "";
//   String time = "";
//   String description = "";
//
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Create a New Event"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a title.';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     title = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Title',
//                 ),
//               ),
//         SizedBox(height: 16.0),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a title.';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     description = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Description',
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a date.';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     date = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Date',
//                 ),
//               ),
//         SizedBox(height: 16.0),
//         TextFormField(
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'Please enter a time.';
//             }
//             return null;
//           },
//         onChanged: (value) {
//           setState(() {
//             time = value;
//           });
//         },
//         decoration: InputDecoration(
//           labelText: 'Time',
//         ),
//       ),
//         SizedBox(height: 16.0),
//         ElevatedButton(onPressed: (){
//           if (_formKey.currentState!.validate())
//           Navigator.pop(context);
//           Navigator.push(context, MaterialPageRoute(builder:
//               (context) => Events()));
//         }, child: Text("Create"))
//       ]))
//
//       ));
//   }
// }



//import 'package:flutter/material.dart';
// import '../../../profile.dart';
// import '../../events/ui/events.dart';
// import '../../../questionsAndAnswers.dart';
//
// class DiseasesApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Information',
//       home: DiseasesPage(),
//     );
//   }
// }
//
// void _createInfoScreen(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       String name = '';
//       String symptoms;
//       String description = '';
//       return AlertDialog(
//         title: Text('Create a New Event'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Disease Name',
//               ),
//               onChanged: (value) {
//                 name = value;
//               },
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Symptoms',
//               ),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 symptoms = value;
//               },
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Additional Details',
//               ),
//               onChanged: (value) {
//                 description = value;
//               },
//             ),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Do something with the entered details
//               Navigator.of(context).pop();
//             },
//             child: Text('Save'),
//           ),
//         ],
//       );
//     },
//   );
// }
//
// class DiseasesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             color: Colors.lightBlue[100],
//
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                     children: [
//                       SizedBox(height: 70),
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundImage: AssetImage('../logo.jpg'),
//                       ),
//                       SizedBox(height: 30, width: 20,),
//                       Text("Information on Diseases",
//                         style: TextStyle(fontSize: 20),),
//                     ]
//                 ),
//
//                 SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: InkWell(
//                     onTap: () {
//                       _createInfoScreen(context);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue,
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//
//             ),
//           ),
//           SizedBox(height: 30),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(20),
//               children: [
//                 Card(
//                   child: ListTile(
//                     title: Text('Disease 1'),
//                     subtitle: Text('Symptom'),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Disease 2'),
//                     subtitle: Text('Symptom'),
//                   ),
//                 ),
//               Card(
//               child: ListTile(
//               title: Text('Disease 3'),
//               subtitle: Text('Symptom'),
//               ),
//               ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   //Navigator.push(
//                     //context,
//                     //MaterialPageRoute(builder: (context) => EventsApp()),);
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../events.jpg'),
//                         width: 40,
//                         height: 40),
//                     Text("Events"),
//
//                   ],),),
//
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) =>
//                         QuestionsAndAnswersApp()),
//                   );
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../ask.jpg'),
//                         width: 40,
//                         height: 40),
//                     Text("Q&A"),
//
//                   ],),),
//
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DiseasesApp()),
//                   );
//                   // Navigate to Diseases page
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../answer.jpg'),
//                         width: 40,
//                         height: 40),
//                     Text("Information"),
//                   ],),),
//
//               GestureDetector(
//                 onTap: () {
//                   Profile(context);
//                 },
//                 child: Column(
//                   children: [
//                     Image(
//                         image: AssetImage('../profile.JPG'),
//                         width: 40,
//                         height: 40),
//                     Text("Profile"),
//                   ],),),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }


//void _changeUsername(BuildContext context){
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String _newUsername = '';
//         return AlertDialog(
//             title: Text('Change Username'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Enter New Username',
//                   ),
//                   onChanged: (value) {
//                     _newUsername = value;
//                   },
//                 ),
//               ],
//             ),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Do something with the entered details
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Save'),
//               ),
//             ]);
//       });
//
// }
//
//
//
// void _changePassword(BuildContext context){
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String _newPassword = '';
//         return AlertDialog(
//             title: Text('Change Password'),
//             content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Enter Old Password',
//                     ),
//                     onChanged: (value) {
//                       _newPassword = value;
//                     },
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Enter New Password',
//                     ),
//                     onChanged: (value) {
//                       _newPassword = value;
//                     },
//                   ),
//                 ]),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Do something with the entered details
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Save'),
//               ),
//             ]);
//       });
//
//
// }
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Profile(),
//     );
//   }
// }
//
//
//
// class Profile extends StatelessWidget{
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   radius: 27,
//                   backgroundImage: AssetImage("../profile.jpg"),
//                 ),
//                 Text("Your Profile"),
//                 SizedBox(height: 170,)
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     showDialog(context: context, builder: (BuildContext context){
//                       return AlertDialog(
//                         title: Text('Edit Account'),
//                         actions: <Widget>[
//                           TextButton(
//                             child: Text('Change Username'),
//                             onPressed: () {
//                               _changeUsername(context);
//                             },
//                           ),
//                           TextButton(
//                             child: Text('Change Password'),
//                             onPressed: () {
//                               _changePassword(context);
//                             },
//                           ),
//                         ],
//                       );
//                     });
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("Edit Your Account"),
//                     ],),),], ),
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text('Confirm Logout'),
//                               content: Text('Are you sure you want to delete your account?'),
//                               actions: <Widget>[
//                                 TextButton(
//                                   child: Text('Cancel'),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                                 TextButton(
//                                   child: Text('Delete'),
//                                   onPressed: () {
//                                     Navigator.push(context,
//                                         MaterialPageRoute(builder: (context) => LoginPage()));
//                                   },
//                                 ),
//                               ],
//                             );});
//
//                     },
//                     child: Column(
//                       children: [
//                         Text("Delete Your Account"),
//                       ],),),
//                 ]
//             ),
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text('Confirm Logout'),
//                             content: Text('Are you sure you want to logout?'),
//                             actions: <Widget>[
//                               TextButton(
//                                 child: Text('Cancel'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                               ),
//                               TextButton(
//                                 child: Text('Logout'),
//                                 onPressed: () {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) => LoginPage()));
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: Column(
//                       children: [
//                         Text("Log Out"),
//                       ],),),
//                 ]
//             ),
//           ],
//         ));
//   }
// }


