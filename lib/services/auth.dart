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
  Stream<User> get user {
    return _auth.authStateChanges()
    .map((User?  user )=> _userFromFirebaseUser(user))
    //.where((user)=>user != null)
    .map((user?) => user!);
    //.map(_userFromFirebaseUser(user));
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

  //sign in with email and password

  //sign out
  }
}
