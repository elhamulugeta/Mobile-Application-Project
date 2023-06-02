import 'package:flutter/material.dart';
import 'package:untitled1/diseases/diseasesRepository/diseasesRepository.dart';
class NewDiseases extends StatefulWidget{
  const NewDiseases({super.key});

  State<NewDiseases> createState() => _NewDiseasesState();

}

class _NewDiseasesState extends State<NewDiseases>{
  List<List> diseases = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _symptomController = TextEditingController();
  final diseasesRepository = DiseasesRepository();

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Create a New Information Field"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a title.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _symptomController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter at least one symptom.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Symptoms',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      SizedBox(height: 16.0),
                      SizedBox(height: 16.0),
                      ElevatedButton(onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                            final newDisease = {
                              "title": _titleController.text,
                              "symptom": _symptomController.text,
                            };

                            await diseasesRepository.addDiseases(newDisease);
                        }
                          Navigator.pop(context);

                      }, child: Text("Create"))
                    ]))

        ));
  }
}