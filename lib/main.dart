import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salon/screens/category_screen/category_screen.dart';
import 'package:salon/screens/home_screen/home_screen.dart';
import 'package:salon/screens/login_screen/login_screen.dart';
import 'package:salon/screens/otp_screen/otp_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'Hindi'),
      ),
    ),
    // initialRoute: '/login_screen',
    routes: {
      // '/': (context) => LoginScreen(),
      // '/': (context) => OtpScreen(verificationId: '',),
      '/': (context) => HomeScreen(),
      // '/': (context) => CategoryScreen(),

      '/login_screen': (context) => LoginScreen(),
      '/otp_screen': (context) => OtpScreen(
            verificationId: '',
          ),
      '/home_screen': (context) => HomeScreen(),
      '/category_screen': (context) => CategoryScreen(),

    },
  ));
}
