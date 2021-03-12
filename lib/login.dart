import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itax_test/Firstpage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 251, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 168,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              alignment: Alignment.center,
              child: Text(
                "Login",
                style: GoogleFonts.mitr(
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(69, 76, 96, 1),
                  fontSize: 40,
                  wordSpacing: -0.29,
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              height: 48,
              width: 334,
              child: TextFormField(
                validator: (val) =>
                    val != "iTax@mail.com" ? "Email: iTax@mail.com" : null,
                style: GoogleFonts.mitr(),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(218, 219, 223, 1), width: 1),
                      borderRadius: BorderRadius.circular(5.0)),
                  hintText: 'Email',
                  hintStyle: GoogleFonts.mitr(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(167, 178, 172, 1),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 48,
              width: 334,
              child: TextFormField(
                validator: (val) => val != "pass" ? "Password: pass" : null,
                style: GoogleFonts.mitr(),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(218, 219, 223, 1), width: 1),
                      borderRadius: BorderRadius.circular(5.0)),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.mitr(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(167, 178, 172, 1),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Firstpage()),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.only(top: 11, bottom: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color.fromRGBO(1, 178, 102, 1),
                ),
                width: 334,
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mitr(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 16,
                    wordSpacing: -0.2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
