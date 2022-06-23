import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/constants/assets_path.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String username = "Julia";
  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) => Container(
                child: Scrollbar(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonBar(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "login");
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                            text: "Login ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                            children: [
                                              TextSpan(
                                                  text: "•",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor))
                                            ]),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "signup");
                                      },
                                      child: Text("Sign Up",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3)),
                                )
                              ],
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(IMAGE_ASSET_profile_0),
                              maxRadius: 24,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Divider(
                          height: 10,
                          thickness: 2,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                        child: RichText(
                          text: TextSpan(
                              text: "Welcome Back,\n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                    text: "$username",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor))
                              ]),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                        child: TextField(
                          decoration:
                              InputDecoration(hintText: "Email address"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                        child: TextField(
                            obscureText: _obscureText,
                            onTap: _toggle,
                            decoration: InputDecoration(
                              hintText: "Password",
                            )),
                      ),
                      Container(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(40, 20, 10, 0),
                          child: Ink(
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.facebook),
                              iconSize: 30,
                              color: Colors.red,
                              onPressed: () {
                                print("facebook");
                              },
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                            child: MaterialButton(
                              onPressed: () => {},
                              child: Text("Forgot password?",
                                  style: Theme.of(context).textTheme.bodyText2),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 40, 0),
                            child: Ink(
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                splashColor: Theme.of(context).primaryColor,
                                icon: Icon(Icons.keyboard_arrow_right_outlined),
                                iconSize: 30,
                                color: Colors.red,
                                onPressed: () {
                                  print("Arrow");
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
