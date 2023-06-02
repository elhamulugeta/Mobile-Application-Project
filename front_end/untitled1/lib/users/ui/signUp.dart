import 'package:flutter/material.dart';
import 'package:untitled1/events/ui/user_events.dart';
import '../../events/ui/events.dart';
import 'package:untitled1/users/models/users_model.dart';
import 'package:untitled1/users/repositories/users_repository.dart';
import 'package:untitled1/users/bloc/users_bloc.dart';
import '../../diseases/ui/diseases.dart';
import '../../diseases/ui/diseases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/events/ui/doctor_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => UsersRepository(),
        child: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoginForm = true;
            final usersRepository = UsersRepository();
            String role = "User";

            final TextEditingController _nameListener = TextEditingController();
            final TextEditingController _passwordListener = TextEditingController();
            final TextEditingController _roleListener = TextEditingController();

            void _toggleForm() {
              setState(() {
                _isLoginForm = !_isLoginForm;
              });
            }

            List<UsersModel> userlist = [];

  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(
        RepositoryProvider.of<UsersRepository>(context), )..
        add(LoadUsersButtonClickedEvent(),
      ),

      child: Scaffold(
      backgroundColor: Colors.white,
      body:BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {

            if (state is UsersLoadedState) {
               userlist = state.users;
              }

       return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[800]!,
                  Colors.blue[200]!,
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      TextFormField(
                        controller: _nameListener,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _passwordListener,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password.';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      if (!_isLoginForm)
                        DropdownButtonFormField<String>(
                          onChanged: (String? newValue) {
                          setState(() {
                            role = newValue!; // Update the selectedRole variable
                          }
                          );
                          },
                          value: role,
                          items: <String>['Admin', 'User', 'Doctor']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Role',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      SizedBox(height: 10.0),


                      ElevatedButton(
                        onPressed: () async {
                          if (_isLoginForm){
                            final user = {
                                    "name": _nameListener.text,
                                    "password": _passwordListener.text,
                          };

                          if (user['name'] == "" || user['password'] == ""){}
                          
                          else{
                            for (UsersModel usersModel in userlist){
                            if (usersModel.name == user['name']){
                               if (usersModel.role == 'User'){
                                Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => UserEvents()));
                               }

                               else if (usersModel.role == 'Doctor'){
                                 Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => DoctorEvents()));
                               }

                               else if (usersModel.role == 'Admin'){
                                 Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Events()));
                               }
                            }
                          } 
                          }}
                          

                          else if(!_isLoginForm){
                            final newUser = {
                              "name": _nameListener.text,
                              "password": _passwordListener.text,
                              "role": role,
                            };

                            await usersRepository.addUser(newUser);
                           if (newUser['role'] == 'User'){
                                Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => UserEvents()));
                               }

                               else if (newUser['role'] == 'Doctor'){
                                 Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => DoctorEvents()));
                               }

                               else if (newUser['role'] == 'Admin'){
                                 Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Events()));
                               }
                            
                          }
                        },
                        child: Text(_isLoginForm ? 'Login' : 'Sign Up'),
                      ),
                      SizedBox(height: 10.0),


                      Center(
                        child: GestureDetector(
                          onTap: _toggleForm,
                          child: Text(
                            _isLoginForm
                                ? 'Don\'t have an account? Sign up'
                                : 'Already have an account? Login',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
      }
    )));
  }
}
