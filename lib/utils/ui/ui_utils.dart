import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Error Screen
class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          child: Center(
              child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.no_meals,
          size: 60,
          color: Theme.of(context).primaryColor,
        ),
      ))),
      Container(
          child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text("Page not available!",
              style: Theme.of(context).textTheme.bodyText1),
        ),
      )),
      Container(
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "home"),
                    child: Text("Back",
                        style: Theme.of(context).textTheme.bodyText2),
                  ))))
    ]));
  }
}

// Connection Error Screen
class ConnectionErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          child: Center(
              child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.wifi_off,
          size: 60,
          color: Theme.of(context).primaryColor,
        ),
      ))),
      Container(
          child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text("We are Sorry. An error occurred!",
              style: Theme.of(context).textTheme.bodyText1),
        ),
      )),
      Container(
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "home"),
                    child: Text("Back",
                        style: Theme.of(context).textTheme.bodyText2),
                  ))))
    ]));
  }
}
