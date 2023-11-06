// ignore_for_file: prefer_const_constructors

// import 'package:flutter/src/foundation/key.dart';
import 'package:ev_charging/signup_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(padding: EdgeInsets.only(left: 30, right: 20)),
              // Icon(Icon.)
              //Hello statement
              Image.asset(
                'assets/charging.png',
                width: 130,
              ),
              SizedBox(height: 20),
              Text(
                "EV Charging App",
                textAlign: TextAlign.center,
                style: GoogleFonts.hind(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Hello Again!",
                style: GoogleFonts.ptSans(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 45, 44, 44),
                  fontSize: 25,
                ),
              ),

              SizedBox(height: 15),
              Text(
                "Welcome Back, you've been missed!",
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 20),

              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, '/');
                        });
                      }, //for signup page
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              //not registered or remebered, register now
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Don't you have an account?",
                    style: GoogleFonts.montserrat(),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, '/signup');
                      });
                    },
                    child: Text(
                      " Sign up",
                      style: TextStyle(
                          color: Color.fromARGB(255, 20, 109, 183),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
