import 'package:firebase_xample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthSerivce _auth = AuthSerivce();

  //text field state

  String email='';
  String  password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        actions: <Widget> [
          TextButton.icon(onPressed: () {

          },
           icon: Icon(Icons.person),
           label: Text ('Register'),
           )
        ],
        backgroundColor: Colors.black,
        title: Text("sign in to vjdj's crew"),
      ),
      body: Container(
        
        padding:
          EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: ( val) {

                    setState(() => email =val 
                      
                    );


                  },
                ),
                SizedBox(height :20.0),
                TextFormField(
                  obscureText: true,
                  onChanged: (val){
                    setState(() => password =val
                    );

                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  ),
                  child: Text(
                    'sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    print(email);
                    print(password);

                  },
                  
                  

                 
                  )
              ],
            ) ),

        
        
      ),

    );
  }
}