import 'package:firebase_xample/services/auth.dart';
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

  //text field state

  String email='';
  String  password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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

                  validator: (val) => val!.isEmpty ? 'enter an email' : null,
                  onChanged: ( val) {

                    setState(() => email =val 
                      
                    );


                  },
                ),
                SizedBox(height :20.0),
                TextFormField(
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
                      print(email);
                      print(password);
                    }
                    

                  },
                  
                  

                 
                  )
              ],
            ) ),

        
        
      ),

    );
  }
}
    
