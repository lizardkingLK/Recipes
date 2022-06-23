import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/constants/assets_path.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var sources = [
    IMAGE_ASSET_splash_1,
    IMAGE_ASSET_splash_2,
    IMAGE_ASSET_splash_3,
    IMAGE_ASSET_splash_4,
    IMAGE_ASSET_splash_5,
    IMAGE_ASSET_splash_6,
    IMAGE_ASSET_splash_7,
    IMAGE_ASSET_splash_8
  ];

  var _random;

  _WelcomeScreenState() {
    this._random = new Random();
  }

  String loadImage() {
    return sources[this._random.nextInt(sources.length)].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(loadImage()),
          fit: BoxFit.cover,
        ),
        color: Theme.of(context).backgroundColor,
      ),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Divider(
                height: 20,
                thickness: 20,
                color: Theme.of(context).primaryColor),
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Text("Reciipes",
                  style: Theme.of(context).textTheme.headline2)),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Text(
                "Hello from the Reciipes, With our app you will find the most delicious and nutritious meals for your taste.",
                style: Theme.of(context).textTheme.headline4),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                child: Text(
                  "Let's Go",
                  style: Theme.of(context).textTheme.headline5,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "home");
                },
              ),
            ),
            Container(
              color: Colors.red,
              margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: Text("Join now to have your own Reciipes.",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Navigator.pushNamed(context, "signup");
                },
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}
