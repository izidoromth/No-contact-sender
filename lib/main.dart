import 'package:flutter/material.dart';
import 'package:nocontact_wppsender/views/main.view.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> wppgreen = {
  50: Color.fromRGBO(37, 211, 102, .1),
  100: Color.fromRGBO(37, 211, 102, .2),
  200: Color.fromRGBO(37, 211, 102, .3),
  300: Color.fromRGBO(37, 211, 102, .4),
  400: Color.fromRGBO(37, 211, 102, .5),
  500: Color.fromRGBO(37, 211, 102, .6),
  600: Color.fromRGBO(37, 211, 102, .7),
  700: Color.fromRGBO(37, 211, 102, .8),
  800: Color.fromRGBO(37, 211, 102, .9),
  900: Color.fromRGBO(37, 211, 102, 1),
};

MaterialColor wppGreen = MaterialColor(0xFF25D366, wppgreen);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Sender',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: wppGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainView(),
    );
  }
}
