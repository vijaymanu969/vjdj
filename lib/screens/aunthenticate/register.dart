import 'package:firebase_xample/services/auth.dart';
import 'package:firebase_xample/shared/constants.dart';
import 'package:firebase_xample/shared/loading.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {

  final Function toggleview;
  Register({required this.toggleview});

   

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthSerivce _auth= AuthSerivce();

  final _formKey = GlobalKey<FormState>();

  bool loading=false;

  //text field state

  String email='';
  String  password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("sign up to vjdj's crew"),
        actions: <Widget> [

          TextButton.icon(
             icon: Icon(Icons.person),

             label: Text('Sign in'),

             onPressed: (){
                widget.toggleview();
              

             },
          ),
        ],
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

                  validator: (val) => val!.isEmpty ? 'enter an email' : null,
                  onChanged: ( val) {

                    setState(() => email =val 
                      
                    );


                  },
                ),
                SizedBox(height :20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) =>val!.length < 6  ? 'enter a paassword 6+ chars long' : null,
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
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{

                    if (_formKey.currentState!.validate()){

                      setState(() =>loading=true 
                        
                      );
                      dynamic result =await _auth.registerWithEmailAndPassword(email,password);
                      if (result==null){
                        setState(() {
                        error ="please supply a valid email"; 
                        loading=false;
                      });
                    
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
            ) 
            ),

        
        
      ),

    );
  }
}
    
