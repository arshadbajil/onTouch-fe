import 'package:flutter/material.dart';
import 'package:on_touch/src/Screens/Auth/loginPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
//common files
import 'package:on_touch/src/Screens/Auth/authCommon/widgetAduniverse.dart';
import 'package:on_touch/src/Screens/Auth/authCommon/widgetPassword.dart';
import 'package:on_touch/src/Screens/Auth/authCommon/widgetMobile.dart';
import 'package:on_touch/src/Screens/common/nameWidget.dart';
import 'package:on_touch/src/Screens/Auth/authCommon/widgetSubTitle.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _username, _email, _password = "", _confirmPassword = "", _mobile;
  final _formKey = GlobalKey<FormState>();

  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();
  FocusNode _mobileFocusNode = FocusNode();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            Text('Back',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget nameInput() {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      focusNode: _usernameFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "e.g John Deo",
        hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'Invalid username';
        else
          return null;
      },
      onSaved: (name) => _username = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _usernameFocusNode, _mobileFocusNode);
      },
    );
  }

  Widget emailInput() {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "e.g abc@gmail.com",
        hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
      textInputAction: TextInputAction.next,
      validator: (email) {
        if (email != null) {
          return EmailValidator.validate(email)
              ? null
              : "Invalid email address";
        }
        return null;
      },
      onSaved: (email) => _email = email,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
      },
    );
  }

  Widget submitButton() {
    return FlatButton(
        color: Colors.transparent,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            toastMessage(
                "Username: $_username\nEmail: $_email\nPassword: $_password");
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [hexToColor('#5222D0'), hexToColor('#291168')])),
          child: Text(
            'Register Now',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget formPageBody() {
    return Container(
      padding: EdgeInsets.all(1),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              nameInput(),
              SizedBox(
                height: 2,
              ),
              MobileInput(
                mobileFocusNode: _mobileFocusNode,
                mobile: _mobileFocusNode,
                nextFocusNode: _emailFocusNode,
              ),
              SizedBox(
                height: 2,
              ),
              emailInput(),
              SizedBox(
                height: 2,
              ),
              PasswordInput(
                passwordFocusNode: _passwordFocusNode,
                password: _password,
                nextFocusNode: _confirmPasswordFocusNode,
              ),
              SizedBox(
                height: 2,
              ),
              PasswordInput(
                passwordFocusNode: _confirmPasswordFocusNode,
                password: _confirmPassword,
                labeltext: 'Confirm Password',
                nextFocusNode: null,
                confirmPassword: _password,
              ),
              SizedBox(
                height: 20,
              ),
              submitButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [hexToColor('#5222D0'), hexToColor('#291168')])),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .12),
                    NameAppWidget(),
                    SizedBox(
                      height: 6,
                    ),
                    SubTitleText(
                      subTitle: 'Sign up to continue',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    formPageBody(),
                    SizedBox(
                      height: 1,
                    ),
                    _loginAccountLabel(),
                    SizedBox(height: height * .09),
                    FromAdUniverse(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIos: 1,
      fontSize: 16.0);
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
