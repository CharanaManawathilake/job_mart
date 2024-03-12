import 'package:flutter/material.dart';
import 'package:job_mart/pages/auth/signin.dart';
import 'package:job_mart/pages/auth/signup.dart';

import 'pages/home.dart';

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
        title: 'Job Mart',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
          "/signin": (context) => const SignIn(),
          "/signup": (context) => const SignUp()
        });
  }
}
