import 'package:flutter/material.dart';


class RegisteredEvents extends StatefulWidget{
  const RegisteredEvents({super.key});

  State<RegisteredEvents> createState() => _RegisteredEventsState();

}

class _RegisteredEventsState extends State<RegisteredEvents>{

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
                Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,
              color: Colors.black,))
          ],
          title: Text("Your Events"),),

      
    );
  }
}