// import 'dart:convert';

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:untitled1/diseases/diseases_model.dart';
import 'package:untitled1/diseases/diseasesRepository/diseasesRepository.dart';
import 'package:untitled1/diseases/bloc/diseases_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/diseases/ui/create_diseases.dart';
import 'package:untitled1/events/ui/events.dart';
import 'package:untitled1/users/ui/profile.dart';

class Diseases extends StatelessWidget{
  const Diseases({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => DiseasesRepository(),
        child: DiseasesPage(),
        ),
    );
  }
}

class DiseasesPage extends StatefulWidget {
  DiseasesPage({Key? key}) : super(key: key);

  @override
  _DiseasesPageState createState() => _DiseasesPageState();
}

class _DiseasesPageState extends State<DiseasesPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Events()));
           
        break;
      case 2:
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }
  }


  @override
 Widget build(BuildContext context) {
  return BlocProvider(
    create: (context) => DiseasesBloc(
      RepositoryProvider.of<DiseasesRepository>(context),
    )..add(LoadDiseasesButtonClickedEvent()),
    child: Scaffold(
      appBar: AppBar(
        title: const Text("Information on Diseases", style: TextStyle(fontSize: 20)),
        backgroundColor: const Color.fromARGB(255, 8, 43, 71),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewDiseases()));
          }, icon: Icon(Icons.add_rounded, color: Colors.white,))
        ],
      ),
      body: BlocBuilder<DiseasesBloc, DiseasesState>(
        builder: (context, state) {

          if (state is DiseasesLoadedState) {
            List<DiseasesModel> userlist = state.diseases;

            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: userlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.all(40),
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Column(
                                children: [
                                  Text("Disease: " + userlist[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,), 
                                  Text("Symptoms: \n" + userlist[index].symptom,)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: () {
                                  }, icon: Icon(Icons.edit)),
                        
                                  SizedBox(width: 10),

                                  IconButton(onPressed: () {

                                    showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirmation'),
                                  content: Text('Are you sure you want to delete this event?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Handle delete operation
                                        Navigator.pop(context); // Close the dialog
                                      },
                                      child: Text('Delete'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Close the dialog
                                      },
                                      child: Text('Cancel'),
                                    ),
                                  ],
                                );
                              },
                            );
                                  }, icon: Icon(Icons.delete)),
                                ],
                              ),
                              SizedBox(height: 30,),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_today, color: Colors.blue),
                        label: 'Events',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.wallet, color: Colors.blue),
                        label: 'Info',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_box, color: Colors.blue),
                        label: 'Profile',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.blue,
                    onTap: _onItemTapped,
                  ),
                ],
              ),
            );
          }

          return Container(); // Return an empty container if the state is not handled.
        },
      ),
    ),
  );
}}