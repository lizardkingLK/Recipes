import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecipeSection extends StatelessWidget {
  String _title;
  List<String> _list;
  IconData _icon;

  RecipeSection(String title, String pattern, IconData icon, String paragraph) {
    this._title = title;
    this._icon = icon;
    this._list = paragraph.split(pattern);
    this._list.forEach((element) => element.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      this._title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(
                    child: Icon(
                      _icon,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              )),
          Column(
              children: this._list.map((item) {
            return Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:
                  Text("$item.", style: Theme.of(context).textTheme.bodyText2),
            );
          }).toList()),
        ],
      ),
    );
  }
}
