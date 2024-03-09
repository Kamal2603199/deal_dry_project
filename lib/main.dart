import 'package:cs_tech/home_screen.dart';
import 'package:cs_tech/model/device_info.dart';
import 'package:cs_tech/otp_screen.dart';
import 'package:cs_tech/register_page.dart';
import 'package:cs_tech/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => SplashScreen(),
        "/profilePage": (context) => RegisterPage(),
        "/otpVerification": (context) => OtpScreen(),
        "/HomeScreen": (context) => Home(),
      },
    );
  }
}