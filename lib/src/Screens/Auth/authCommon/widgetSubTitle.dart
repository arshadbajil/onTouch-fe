import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final subTitle;
  const SubTitleText({Key key, @required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: subTitle,
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ));
  }
}
