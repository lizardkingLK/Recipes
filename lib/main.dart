import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.redAccent[700],
            errorColor: Colors.blue[700],
            fontFamily: 'Montserrat'),
        home: Scaffold(
            resizeToAvoidBottomPadding: true,
            backgroundColor: Colors.amberAccent,
            appBar: AppBar(
              title: Text('Sign Up', style: TextStyle(fontSize: 32)),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.redAccent[700],
                        Colors.red,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
            ),
            body: SignUpForm()));
  }
}

// Create a Form widget.
class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignUpFormState extends State<SignUpForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // picture parameters
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  // text inputs
  String picture = '',
      firstName = '',
      lastName = '',
      emailAddress = '',
      nICNumber = '',
      contactNo = '',
      address = '';

  // set initial widget state
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Stack(children: [
          SingleChildScrollView(
              child: Column(children: [
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: FutureBuilder<File>(
                        future: file,
                        builder: (BuildContext context,
                            AsyncSnapshot<File> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              null != snapshot.data) {
                            tmpFile = snapshot.data;
                            base64Image =
                                base64Encode(snapshot.data.readAsBytesSync());
                            return Flexible(
                                child: ClipOval(
                              child: Image.file(
                                snapshot.data,
                                fit: BoxFit.fill,
                                width: 96.0,
                                height: 96.0,
                              ),
                            ));
                          } else if (null != snapshot.error) {
                            return const Text(
                              'Error Picking Image',
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return const CircleAvatar(
                              backgroundColor: Colors.amber,
                              minRadius: 48.0,
                              child: Text('MA',
                                  style: TextStyle(color: Colors.white)),
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: IconButton(
                            iconSize: 16.0,
                            splashColor: Colors.amber[700],
                            hoverColor: Colors.red,
                            icon: Icon(Icons.create_sharp,
                                color: Colors.amber[900]),
                            tooltip: 'Change Picture',
                            color: Colors.white,
                            onPressed: () {
                              handleUpdatePicture();
                            }))
                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
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
                  onChanged: (value) {
                    setState(() => firstName = value);
                  },
                  validator: (value) {
                    return validateInput(value, 'Firstname');
                  },
                )),
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
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
                  onChanged: (value) {
                    setState(() => lastName = value);
                  },
                  validator: (value) {
                    return validateInput(value, 'Lastname');
                  },
                )),
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
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
                  onChanged: (value) {
                    setState(() => emailAddress = value);
                  },
                  validator: (value) {
                    return validateInput(value, 'Email Address');
                  },
                )),
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
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
                  onChanged: (value) {
                    setState(() => nICNumber = value);
                  },
                  validator: (value) {
                    return validateInput(value, 'NIC Number');
                  },
                )),
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
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
                  onChanged: (value) {
                    setState(() => contactNo = value);
                  },
                  validator: (value) {
                    return validateInput(value, 'Contact No');
                  },
                )),
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Address...',
                    helperText: 'max 100 chars.',
                    contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 32),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.amberAccent,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                  onChanged: (value) {
                    setState(() => address = value);
                  },
                  validator: (value) {
                    return validateInput(value, 'Address');
                  },
                )),
            // Container(
            //   margin: EdgeInsets.all(8.0),
            //   child: FutureBuilder<File>(
            //     future: file,
            //     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done &&
            //           null != snapshot.data) {
            //         tmpFile = snapshot.data;
            //         base64Image = base64Encode(snapshot.data.readAsBytesSync());
            //         return Flexible(
            //           child: Image.file(
            //             snapshot.data,
            //             fit: BoxFit.fill,
            //           ),
            //         );
            //       } else if (null != snapshot.error) {
            //         return const Text(
            //           'Error Picking Image',
            //           textAlign: TextAlign.center,
            //         );
            //       } else {
            //         return const Text(
            //           'No Image Selected',
            //           textAlign: TextAlign.center,
            //         );
            //       }
            //     },
            //   ),
            // ),
            Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: FlatButton(
                  color: Colors.redAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Colors.red)),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    handleSignUp();
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ))
          ]))
        ]));
  }

  void handleUpdatePicture() async {
    print('Received update picture click');
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  String validateInput(String value, String type) {
    if (value.isEmpty) {
      return 'Please enter your ' + type;
    } else if (type == 'Email Address') {
      if (!EmailValidator.validate(value)) {
        return 'Invalid Email Address entered';
      }
    }

    return null;
  }

  void handleSignUp() {
    print('Received sign up click');
    print(picture +
        firstName +
        lastName +
        emailAddress +
        nICNumber +
        contactNo +
        address);
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Processing Data' +
              picture +
              firstName +
              lastName +
              emailAddress +
              nICNumber +
              contactNo +
              address)));
    }
  }
}
