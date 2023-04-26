import 'package:firebase_xample/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthSerivce _auth = AuthSerivce();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("sign in to bitches crew"),
      ),
      body: Container(
        
        padding:  EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: ElevatedButton(
          
          child:Text('sign in anon'),

          onPressed: ()async{

            dynamic result= await _auth.signInAnon();
            if(result==null){
              print('error siging in');
            
            }else {
              print('signed in');
              print(result);
              
            }
        }, 
        ),
        
      ),

    );
  }
}