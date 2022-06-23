import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageChooser extends StatefulWidget {
  @override
  State createState() {
    return ImageChooserState();
  }
}

class ImageChooserState extends State {
  PickedFile imgFile;

  Future showDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        openGallery(context);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      openCamera(context);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Image Camera"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: SingleChildScrollView(
          // child: Expanded(
          child: Column(
            children: [
              Card(
                child: (imgFile == null)
                    ? Icon(Icons.camera_alt)
                    : Image.file(File(imgFile.path)),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(context);
                },
                child: Text("Choose Image"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imgFile = pickedFile;
    });

    Navigator.pop(context);
  }

  void openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imgFile = pickedFile;
    });
    Navigator.pop(context);
  }
}
