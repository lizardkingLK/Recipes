import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.redAccent[700], fontFamily: 'Montserrat'),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.amberAccent,
            appBar: AppBar(
              title: Text('Sign Up', style: TextStyle(fontSize: 32)),
              flexibleSpace: Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.redAccent[700],
                        Colors.red,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
            ),
            body: Stack(children: [
              SingleChildScrollView(
                  child: Column(children: [
                Container(
                  margin: EdgeInsets.all(16.0),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Firstname...',
                        helperText: 'max 50 chars.',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.amberAccent,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Lastname...',
                        helperText: 'max 50 chars.',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.amberAccent,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email Address...',
                        helperText: 'max 30 chars.',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.amberAccent,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'NIC Number...',
                        helperText: 'max 30 chars.',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.amberAccent,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Contact No...',
                        helperText: 'max 10 chars.',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.amberAccent,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Address...',
                        helperText: 'max 100 chars.',
                        contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 64),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.amberAccent,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  // child:
                )
              ]))
            ])));
  }
}
