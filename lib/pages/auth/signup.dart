// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart' as toast;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String dropdownValue = 'jobApplicant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 720,
              ),
              padding: EdgeInsets.fromLTRB(30, 80, 30, 60),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          bottom: 5,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffd9d9d9),
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      20)), /* labelText: 'Enter your data' */
                            ))),
                    Container(
                        margin: EdgeInsets.only(
                          bottom: 5,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffd9d9d9),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      20)), /* labelText: 'Enter your data' */
                            ))),
                    Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffd9d9d9),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      20)), /* labelText: 'Enter your data' */
                            ))),
                    Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: confirm_password,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffd9d9d9),
                              hintText: 'Confirm password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      20)), /* labelText: 'Enter your data' */
                            ))),
                    Container(
                      width: 400,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['jobApplicant', 'employer']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16), // Adjust padding here
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          // Navigator.pushNamed(context, '/');
                          var url =
                              Uri.http("localhost:4000", "/api/auth/signup");
                          // var response = await http.post(url, body: {});
                          // print(response.body);
                          var response = await http.post(url, body: {
                            "name": name.text,
                            "email": email.text,
                            "password": password.text,
                            "confirm_password": confirm_password.text,
                            "role": dropdownValue
                          });
                          // print(response.statusCode);

                          if (response.statusCode == 200) {
                            Navigator.pushNamed(context, '/');
                          } else {
                            // Fluttertoast.showToast(msg: "Error occured");
                            print(response.body);
                            // I can't add a fluttertoast notificatoin, it keeps creating a breakpoint
                          }
                        },
                        child: Container(
                            width: 250,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xff20ef5a),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                                child: Text("Register",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JotiOne',
                                      fontSize: 30,
                                    ))))),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
