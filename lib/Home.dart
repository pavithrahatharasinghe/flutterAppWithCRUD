import 'package:flutter/material.dart';

class employeeHome extends StatefulWidget {
  const employeeHome({Key? key}) : super(key: key);

  @override
  State<employeeHome> createState() => _employeeHomeState();
}

class _employeeHomeState extends State<employeeHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Employee Profile'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[Text('Welcome home')],
          ),
        ),
      ),
    );
  }
}
