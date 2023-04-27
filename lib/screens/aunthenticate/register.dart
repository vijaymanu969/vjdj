import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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

             },
          ),
        ],
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
                    'Register',
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
    
