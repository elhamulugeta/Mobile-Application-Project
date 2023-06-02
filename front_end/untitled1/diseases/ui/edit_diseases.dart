import 'package:flutter/material.dart';

class EditDiseases extends StatefulWidget{
  const EditDiseases({super.key});

  State<EditDiseases> createState() => _EditDiseasesState();

}

class _EditDiseasesState extends State<EditDiseases>{
  Widget build(BuildContext context){
    String _newTitle = "";
    String _newSymptom = "";
    String _newDate = "";
    return AlertDialog(
        title: Text('Edit Disease Information'),
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
                labelText: 'Enter Symptoms',
              ),
              onChanged: (value) {
                _newSymptom = value;
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
