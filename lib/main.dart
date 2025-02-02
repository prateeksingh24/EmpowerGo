import 'package:empowergo/view/Home/homePage.dart';
import 'package:empowergo/view/Onboarding/onbordingScreen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/onboarding',
      home: OnboardingScreen(),
      routes: {
        '/home': (context) => HomePage(),
        // '/loginScreen': (context) => LoginScreen(),
        // '/signUpScreen': (context) => SignUpScreen(),
        // '/infoForm': (context) => GeneralInfoForm(),
        '/onboarding': (context) => OnboardingScreen(),
      },
    );
  }
}
