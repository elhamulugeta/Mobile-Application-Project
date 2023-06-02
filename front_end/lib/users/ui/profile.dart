import 'package:flutter/material.dart';
import 'package:untitled1/users/ui/signUp.dart';



void _changeUsername(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        String _newUsername = '';
        return AlertDialog(
            title: Text('Change Username'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter New Username',
                  ),
                  onChanged: (value) {
                    _newUsername = value;
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
      });

}



void _changePassword(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        String _newPassword = '';
        return AlertDialog(
            title: Text('Change Password'),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Old Password',
                    ),
                    onChanged: (value) {
                      _newPassword = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter New Password',
                    ),
                    onChanged: (value) {
                      _newPassword = value;
                    },
                  ),
                ]),
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
      });


}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey,
            // Placeholder for the left half of the screen
          ),
          Positioned.fill(
            left: MediaQuery.of(context).size.width / 2,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage("../profile.jpg"),
                ),
                Text("Your Profile"),
                SizedBox(height: 170,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Edit Account'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Change Username'),
                            onPressed: () {
                              _changeUsername(context);
                            },
                          ),
                          TextButton(
                            child: Text('Change Password'),
                            onPressed: () {
                              _changePassword(context);
                            },
                          ),
                        ],
                      );
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Edit Your Account"),
                    ],),),], ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirm Logout'),
                              content: Text('Are you sure you want to delete your account?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Delete'),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => LoginPage()));
                                  },
                                ),
                              ],
                            );});

                    },
                    child: Column(
                      children: [
                        Text("Delete Your Account"),
                      ],),),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Logout'),
                            content: Text('Are you sure you want to logout?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Logout'),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => LoginPage()));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Text("Log Out"),
                      ],),),
                ]
            ),

                    ],

                )
                  ),
                ),
              ),
           ]),
          );
  }
}
