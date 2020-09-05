import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_touch/routes.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:on_touch/src/store/store.dart';

void main() async {
  await Redux.init();
  runApp(OnTouch());
}

class OnTouch extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StoreProvider<AppState>(
        store: Redux.store,
        child: MaterialApp(
          title: 'OnTouch: Let finger tip do the work',
          initialRoute: '/',
          routes: routes,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
              bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
            ),
          ),
          debugShowCheckedModeBanner: false,
        ));
  }
}
