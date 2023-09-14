import 'package:admin_panel/screens/admin_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDNyV1j4W7f5WudVrFnqQlhgnoXr_hZs_0",
        authDomain: "food-bank-65df0.firebaseapp.com",
        projectId: "food-bank-65df0",
        storageBucket: "food-bank-65df0.appspot.com",
        messagingSenderId: "894970073440",
        appId: "1:894970073440:web:34f6343566be0b120d4e05"),
  );
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
