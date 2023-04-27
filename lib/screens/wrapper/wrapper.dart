import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_xample/models/user.dart';
import 'package:firebase_xample/screens/aunthenticate/aunthenticate.dart';
import 'package:firebase_xample/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final _user = Provider.of<customer_user?>(context);

    print(_user);

    //return either home or authenticate widget
    if (_user==null){
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}