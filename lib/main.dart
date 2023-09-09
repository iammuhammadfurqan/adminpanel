import 'package:admin_panel/screens/admin_login.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin_panel/screens/main_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor),
      home: AdminLoginPage(),
    );
  }
}
