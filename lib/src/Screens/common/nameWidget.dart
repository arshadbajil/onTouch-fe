import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class NameAppWidget extends StatelessWidget {
  const NameAppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'O',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'n',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'Touch',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }
}
