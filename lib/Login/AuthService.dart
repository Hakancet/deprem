import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Giriş Fonksiyonu
  Future<User?> singIn(var email, var password) async{
    var user = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }
  // Çıkış Fonksiyonu
  singOut() async{
    return await auth.signOut();
  }
  Future<User?> singUp(var email, var password) async{
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUser(String name, String email, String password) async{
    var users = firestore.collection("users");
    return users.add({
      'name': name,
      'email': email,
      'password': password,
    })
        .then((value) => print("kullanıcı eklendi"))
        .catchError((error) => print("Kullanıcı eklenmedi: $error"));
  }
}