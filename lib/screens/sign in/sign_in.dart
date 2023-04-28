import 'package:firebase_xample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_xample/shared/constants.dart';
class SignIn extends StatefulWidget {

  final Function toggleview;
  SignIn({required this.toggleview});

  

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthSerivce _auth = AuthSerivce();
  final _formKey= GlobalKey<FormState>();

  //text field state

  String email='';
  String  password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        actions: <Widget> [
          TextButton.icon(onPressed: () {
            widget.toggleview();

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
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) =>val!.isEmpty ? ' enter an email' : null,
                  onChanged: ( val) {

                    setState(() => email =val 
                      
                    );


                  },
                ),
                SizedBox(height :20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val!.length<6 ? 'enter a ' : null,
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
                    if (_formKey.currentState!.validate()){
                      dynamic result=await _auth.signInWithEmailAndPassword(email , password);
                      if (result==null){
                        setState(() => error ="could not sign with those crredentials ");

                      }  



                    }
                    

                  },
                  
                  

                 
                  ),
                  SizedBox(height: 12.0,),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red,fontSize: 14.0),
                  )
              ],
            ) ),

        
        
      ),

    );
  }
}