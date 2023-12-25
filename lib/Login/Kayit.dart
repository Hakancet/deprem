import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deprem/Login/AuthService.dart';
import 'package:deprem/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late User user;
  var uuid = Uuid();
  int id = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'DEPREM.DESTEK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: emailController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                labelText: 'E-Mail',
                                hintText: 'ornek@gmail.com',
                                hintStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                    )),
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.red,
                              thickness: 15,
                            ),
                            TextField(
                              controller: nameController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                labelText: 'Ad Soyad',
                                hintText: 'örn: Ali Veli',
                                hintStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                    )),
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.red,
                              thickness: 15,
                            ),
                            TextField(
                              controller: passwordController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                labelText: 'Şifre',
                                hintText: 'örn: 12324',
                                hintStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                    )),
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.red,
                              thickness: 15,
                            ),
                            TextField(
                              controller: passwordAgainController,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                labelText: 'Şifre Tekrardan',
                                hintText: 'örn: 12324',
                                hintStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                    )),
                              ),
                            ),
                            Divider(
                              height: 20,
                              thickness: 15,
                              color: Colors.red,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (nameController.text
                                      .toString()
                                      .isNotEmpty &&
                                      emailController.text
                                          .toString()
                                          .isNotEmpty &&
                                      passwordController.text
                                          .toString()
                                          .isNotEmpty &&
                                      passwordAgainController.text
                                          .toString()
                                          .isNotEmpty) {
                                    if (passwordController.text.toString() ==
                                        passwordAgainController.text
                                            .toString()) {
                                      if (passwordController.text.length >= 6) {
                                        authService.singUp(
                                            emailController.text.toString(),
                                            passwordController.text.toString());

                                        authService.createUser(
                                            nameController.text.toString(),
                                            emailController.text.toString(),
                                            passwordController.text.toString());
                                        // Kullanıcının kayıdını oluşturduk


                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      } else {
                                        var alert = AlertDialog(
                                          actions: [
                                            TextButton(onPressed: () {
                                              Navigator.pop(context);
                                            }, child: Text("Tamam"),),
                                          ],
                                          title: Text("Hatalı İşlem"),
                                          content: Text(
                                              "Şifre En Az 6 Karakterden Oluşmalıdır!!"),
                                        );
                                        showDialog(context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            });
                                      }
                                    } else {
                                      var alert2 = AlertDialog(
                                        actions: [
                                          TextButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text("Tamam")),
                                        ],
                                        title: Text("Hatalı İşlem"),
                                        content: Text("Boş Alan Olmamalı"),
                                      );
                                      showDialog(context: context, builder: (BuildContext context){
                                        return alert2;
                                      });
                                    }
                                  }else{
                                    var alert3 = AlertDialog(
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text("Tamam"))
                                      ],
                                      title: Text("Hatalı İşlem"),
                                      content: Text("Şifreler Aynı Değil"),
                                    );
                                    showDialog(context: context, builder: (BuildContext context){
                                      return alert3;
                                    });
                                  }
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      'Kaydet',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
