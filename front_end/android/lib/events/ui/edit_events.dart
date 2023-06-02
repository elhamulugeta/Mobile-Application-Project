import 'package:flutter/material.dart';

class EditEvents extends StatefulWidget{
  const EditEvents({super.key});

  State<EditEvents> createState() => _EditEventState();

}

class _EditEventState extends State<EditEvents>{
  Widget build(BuildContext context){
          String _newTitle = "";
          String _newDescription = "";
          String _newDate = "";
          String _newTime = "";
          return AlertDialog(
              title: Text('Edit Event'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Title',
                    ),
                    onChanged: (value) {
                      _newTitle = value;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Description',
                    ),
                    onChanged: (value) {
                      _newDescription = value;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Date',
                    ),
                    onChanged: (value) {
                      _newDate = value;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Time',
                    ),
                    onChanged: (value) {
                      _newTime = value;
                    },
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Do something with the entered details
                    Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                ),
              ]);
        }
  }
