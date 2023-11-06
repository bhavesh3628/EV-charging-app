import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_charging/home_page.dart';
import 'package:ev_charging/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget userManagament() {
  return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.hasData && snapshot.data != null) {
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(snapshot.data!.uid)
              .get(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (userSnapshot.hasData) {
              final userData =
                  userSnapshot.data!.data() as Map<String, dynamic>;
              final role = userData['role'];
              if (role == 'user') {
                return const HomePage();
              } else if (role == 'admin') {
                return const HomePage();
              } else {
                return const LoginPage();
              }
            } else {
              return const LoginPage();
            }
          },
        );
      } else {
        return const LoginPage();
      }
    },
  );
}