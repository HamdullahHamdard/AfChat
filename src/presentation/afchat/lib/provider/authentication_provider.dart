import 'package:afchat/services/database_services.dart';
import 'package:afchat/services/navigation_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class AuthenticationProvider extends ChangeNotifier{
  late final FirebaseAuth _auth;
  late final NavigationServices _navigationServices;
  late final DatabaseServices _databaseServices;

  AuthenticationProvider(){
    _auth = FirebaseAuth.instance;
    _navigationServices = GetIt.instance.get<NavigationServices>();
    _databaseServices = GetIt.instance.get<DatabaseServices>();

    _auth.authStateChanges().listen((_user) {
      if(_user != null){
        print("Logged in");
      }else{
        print("Not Authenticated");
      }
    });
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException{
      print("Error logging user in to firebase");
    } catch(e){
      print(e.toString());
    }
  }
}