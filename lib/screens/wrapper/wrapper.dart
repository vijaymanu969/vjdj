import 'package:firebase_xample/screens/aunthenticate/aunthenticate.dart';
import 'package:firebase_xample/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    //return either home or authenticate widget
    return Authenticate();
  }
}