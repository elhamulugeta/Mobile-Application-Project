import 'package:flutter/material.dart';
import 'package:untitled1/diseases/ui/doctor_disease.dart';
import 'package:untitled1/events/models/events_model.dart';
import 'package:untitled1/events/repositories/eventGetRepository.dart';
import 'package:untitled1/events/bloc/events_bloc.dart';
import 'package:untitled1/diseases/ui/diseases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/users/ui/profile.dart'; 

class DoctorEvents extends StatelessWidget {
  const DoctorEvents({Key? key}) : super(key: key);
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
            context, MaterialPageRoute(builder: (context) => DoctorDiseases()));

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
          title: const Text("Events"),
        ),
        body: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {

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
                            color: Colors.blue,
                            elevation: 5,
                            margin: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                ListTile(
                                  title: Text(
                                    userlist[index].description,
                                    style: const TextStyle(color: Colors.white),
                                  ),
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
