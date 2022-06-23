import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeConfig extends StatefulWidget {
  @override
  _ThemeConfigState createState() => _ThemeConfigState();
}

class _ThemeConfigState extends State<ThemeConfig> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Theme.of(context).accentColor,
      title: Text("DarkMode", style: Theme.of(context).textTheme.bodyText1),
      value: this._isDark,
      onChanged: (bool value) {
        setState(() {
          this._isDark = value;
          print(this._isDark);
        });
      },
    );
  }
}
