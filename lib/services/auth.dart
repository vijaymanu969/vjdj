import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_xample/models/user.dart';



class AuthSerivce{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create obj based on firebaseUser
  //User? _userFromFirebaseUser(User? user) {
    //return user != null ? User(uid: user.uid) : null;
  //}
  customer_user? _userFromFirebaseUser(User? user){
    return user != null ? customer_user(uid:user.uid): null ;
  }

  //auth changes user stram

  
  //if error comes it might be from here

  Stream<customer_user?> get user {
    return _auth.authStateChanges()
    //.map((User?  user )=> _userFromFirebaseUser(user))   (3)
    //.where((user)=>user != null)     (1)
    //.map((user) => user);            (4)   three and four coombo
    //.map(_userFromFirebaseUser(user));   (2) one and two combo

    .map(_userFromFirebaseUser);
  }

  //sign in anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print('Signed in anonymously with UID: ${user?.uid}');
      
  }catch(e){
    print('Error signing in anonymously: $e');
    


  }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User ? user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){

      return null;

    }

  }
  

  //register with email and password

  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User ? user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){

      return null;

    }

  }




  //sign out

  Future signout() async{
    try{
        return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;

    }
  }

  
}
