import 'package:flutter/material.dart';

import '../repositories/eventGetRepository.dart';
// import 'package:untitled1/events/ui/events.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class NewEvents extends StatefulWidget {
  const NewEvents({super.key});

  @override
  State<NewEvents> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvents> {
  List<List> events = [];
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String date = "";
  String time = "";
  String description = "";

  final eventsRepository = EventsRepository();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create a New Event"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a description.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _dateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a date.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            date = value;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Date'),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _timeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a time.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            time = value;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Time'),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final newEvent = {
                              "description": _descriptionController.text,
                              "date": _dateController.text,
                              "time": _timeController.text,
                            };

                            await eventsRepository.addEvent(newEvent);

                            Navigator.pop(context);
                          }
                        },
                        child: Text("Create"),
                      )
                    ]))));
  }
}
