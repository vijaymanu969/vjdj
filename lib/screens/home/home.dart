import 'package:firebase_xample/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthSerivce _auth = AuthSerivce();
   Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("vjdj's crew⚡"),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("logout"),
            onPressed: () async {

              await _auth.signout();




            }
          ),
        ]

       
      ),
    );
    
  }
}