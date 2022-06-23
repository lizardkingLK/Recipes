import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class EditRecipeSection extends StatelessWidget {
  String _label;
  String _validationMessage;
  TextInputType _textInputType;
  TextEditingController _controller;
  List<TextInputFormatter> _inputFormatters;

  EditRecipeSection(String label, String validationMessage, bool isMultiline,
      bool isNumeric, TextEditingController controller) {
    this._label = label;
    this._validationMessage = validationMessage;
    this._controller = controller;
    this._textInputType = TextInputType.text;
    this._inputFormatters = [];
    if (isMultiline) {
      this._textInputType = TextInputType.multiline;
    }
    if (isNumeric) {
      this._textInputType = TextInputType.number;
      this._inputFormatters = [FilteringTextInputFormatter.digitsOnly];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              this._label,
              style: Theme.of(context).textTheme.bodyText1,
            )),
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            keyboardType: this._textInputType,
            maxLines: null,
            controller: this._controller,
            inputFormatters: this._inputFormatters,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return this._validationMessage;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
