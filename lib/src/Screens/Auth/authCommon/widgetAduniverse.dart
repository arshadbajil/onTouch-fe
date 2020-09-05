import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FromAdUniverse extends StatelessWidget {
  const FromAdUniverse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'from',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: ' ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextSpan(
              text: 'Ad',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextSpan(
              text: 'Universe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ]),
    );
  }
}
