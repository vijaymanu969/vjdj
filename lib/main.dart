import 'package:firebase_xample/models/user.dart';
import 'package:firebase_xample/screens/wrapper/wrapper.dart';
import 'package:firebase_xample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_xample/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<customer_user?>.value(
      value :AuthSerivce().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        home:Wrapper()
      ),
    );
  }
}