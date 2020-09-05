import 'package:flutter/material.dart';

class MobileInput extends StatelessWidget {
  final mobileFocusNode;
  final mobile;
  final nextFocusNode;
  MobileInput(
      {@required this.mobileFocusNode,
      @required this.mobile,
      @required this.nextFocusNode});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      focusNode: mobileFocusNode,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Mobile",
        labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        hintText: "e.g 9999555511",
        hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
      textInputAction: TextInputAction.done,
      validator: (password) {
        Pattern pattern = r'^[0-9]{10}$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(password))
          return 'Invalid mobile number';
        else
          return null;
      },
      onSaved: (mobile) => mobile = mobile,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, mobileFocusNode, nextFocusNode);
      },
    );
  }
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
