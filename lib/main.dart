import 'package:flutter/material.dart';
import 'package:flutter_with_user_crud/Home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_with_user_crud/Database.dart';
import 'package:flutter_with_user_crud/Classes/Employee.dart';

void main() => runApp(MaterialApp(
      home: firstPage(),
    ));

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Center(
            child: Text(
              'Wayne enterprises',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/logo2.png'),
                  radius: 120.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 40.0,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => runApp(SignIn()),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[900],
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text('Sign in'),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 40.0,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => runApp(SignUp()),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[900],
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text('Sign Up'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final txtUserEmail = TextEditingController();
  final txtUserPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'E - mail',
                      ),
                      controller: txtUserEmail,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'Your Password',
                      ),
                      controller: txtUserPassword,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        if (await DBProvider.db.isValidLogin(
                            txtUserEmail.text, txtUserPassword.text)) {
                          print('valid login');
                          Fluttertoast.showToast(
                              msg: "Login Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.black,
                              fontSize: 16.0);

                         runApp(employeeHome());
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  "Please check your credentials and try again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey[900],
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text('Sign In'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final txtUserEmail = TextEditingController();
  final txtUserFName = TextEditingController();
  final txtUserLName = TextEditingController();
  final txtUserNIC = TextEditingController();
  final txtUserPassword = TextEditingController();
  final txtUserConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'E - mail',
                      ),
                      controller: txtUserEmail,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'First Name',
                      ),
                      controller: txtUserFName,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'Last Name',
                      ),
                      controller: txtUserLName,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'NIC No',
                      ),
                      controller: txtUserNIC,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'Password',
                      ),
                      controller: txtUserPassword,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'ConfirmPassword',
                      ),
                      controller: txtUserConfirmPassword,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        var newEmployee = Employee(
                            txtUserEmail.text,
                            txtUserFName.text,
                            txtUserLName.text,
                            txtUserNIC.text,
                            txtUserPassword.text);
                        DBProvider.db.addNewEmployee(newEmployee);

                        Fluttertoast.showToast(
                            msg: "Sign Up Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.black,
                            fontSize: 16.0);

                        Navigator.push(context, MaterialPageRoute(builder: (context) => employeeHome()));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey[900],
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text('Sign Up'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
