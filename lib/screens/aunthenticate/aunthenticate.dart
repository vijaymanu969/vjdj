import 'package:firebase_xample/screens/aunthenticate/register.dart';
import 'package:firebase_xample/screens/sign%20in/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {

  
  

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleview() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleview:toggleview);
    }
    else {
      return Register(toggleview:toggleview);
    }
    
  }
}