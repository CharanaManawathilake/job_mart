// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(children: [
      Container(
          constraints: BoxConstraints(
            maxHeight: 720,
          ),
          padding: EdgeInsets.fromLTRB(30, 80, 30, 60),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Container(
                        width: 250,
                        height: 70,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff20ef5a),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                            child: Text("Sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JotiOne',
                                  fontSize: 30,
                                ))))),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Container(
                        width: 250,
                        height: 70,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff20ef5a),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                            child: Text("Sign up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JotiOne',
                                  fontSize: 30,
                                )))))
              ]))
    ])));
  }
}
