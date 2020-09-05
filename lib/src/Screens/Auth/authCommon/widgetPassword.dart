import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final passwordFocusNode;
  final password;
  final labeltext;
  final nextFocusNode;
  final confirmPassword;
  PasswordInput(
      {@required this.passwordFocusNode,
      @required this.password,
      this.labeltext = "Passowrd",
      @required this.nextFocusNode,
      this.confirmPassword});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      focusNode: passwordFocusNode,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        suffixIcon: Icon(Icons.lock, color: Colors.white),
      ),
      textInputAction: TextInputAction.done,
      validator: (password) {
        Pattern pattern =
            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(password))
          return 'Invalid password';
        else if (password == confirmPassword && confirmPassword != null) {
          return null;
        } else {
          return 'Password does not match.';
        }
      },
      onSaved: (password) => password = password,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, passwordFocusNode, nextFocusNode);
      },
    );
  }
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
