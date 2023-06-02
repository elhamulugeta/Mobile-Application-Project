// import 'dart:convert';

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:untitled1/events/models/events_model.dart';
import 'package:untitled1/events/repositories/eventGetRepository.dart';
import 'package:untitled1/events/bloc/events_bloc.dart';
import 'package:untitled1/events/ui/edit_events.dart';
import 'package:untitled1/events/ui/create_events.dart';
import 'package:untitled1/diseases/ui/diseases.dart';
// import 'package:untitled1/signUp.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/users/ui/profile.dart'; 

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => EventsRepository(),
        child: EventsPage(),
      ),
    );
  }
}

class EventsPage extends StatefulWidget {
  EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Diseases()));

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
      create: (context) => EventsBloc(
        RepositoryProvider.of<EventsRepository>(context),
      )..add(LoadEventsButtonClickedEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Events", style: TextStyle(fontSize: 20)),
          backgroundColor: const Color.fromARGB(255, 8, 43, 71),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewEvents()));
                },
                icon: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state is CreateEventsActionState) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditEvents()),
              );
            }

            if (state is EventsLoadedState) {
              List<EventsModel> userlist = state.events;

              return Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: userlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            margin: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                ListTile(
                                  title: Text(
                                    userlist[index].description,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                        eventGetRepository updatedEvent(
                                       description: 'Updated description',
                                        date: 'Updated date',
                                        time: 'Updated time',
                                       id: '12345', // Updated ID
                                      );

                                          
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditEvents()));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        )),
                                    SizedBox(width: 10),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Confirmation'),
                                                content: Text(
                                                    'Are you sure you want to delete this event?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      // Handle delete operation
                                                      Navigator.pop(
                                                          context); // Close the dialog
                                                    },
                                                    child: Text('Delete'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context); // Close the dialog
                                                    },
                                                    child: Text('Cancel'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
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
  }
}

