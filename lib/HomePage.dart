import 'package:deprem/Arama.dart';
import 'package:deprem/FastMail.dart';
import 'package:deprem/Maps/MapsPage.dart';
import 'package:deprem/Eczane/Eczane.dart';
import 'package:deprem/deprem/DepremFront.dart';
import 'package:deprem/message/messagePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class HomePage extends StatefulWidget {
  String? email;
  HomePage.withEmail(this.email);
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      drawer: Drawer(
        backgroundColor: Colors.indigoAccent,
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/deprem.jpg'),
                  Divider(
                    height: 3,
                    color: Colors.indigoAccent,
                  ),
                  ListTile(
                    textColor: Colors.black,
                    iconColor: Colors.black,
                    tileColor: Colors.white,
                    leading: Icon(Icons.new_releases),
                    title: Text('Son Depremler'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DepremPage()));
                    },
                  ),
                  Divider(
                    height: 3,
                    color: Colors.indigo,
                  ),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text('Hızlı Mail'),
                    tileColor: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> FastMail()));
                    },
                  ),
                  Divider(
                    height: 3,
                    color: Colors.indigoAccent,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Konum'),
                    tileColor: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MapsPage()));
                    },
                  ),
                  Divider(
                    height: 3,
                    color: Colors.indigoAccent,
                  ),
                  ListTile(
                    leading: Icon(Icons.local_hospital),
                    title: Text('Nöbetçi Eczane'),
                    tileColor: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EczanePage()));
                    },
                  ),
                  Divider(
                    height: 3,
                    color: Colors.indigoAccent,
                  ),
                  ListTile(
                    leading: Icon(Icons.connect_without_contact),
                    title: Text('Ortak İletişim'),
                    tileColor: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MessagePage(email: '',)));
                    },
                  ),
                  Divider(
                    height: 110,
                    color: Colors.indigoAccent,
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Çıkış'),
                    tileColor: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text('DEPREM.DESTEK'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Card(
              color: Colors.blueGrey,
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Padding(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'SON DEPREMLER',
                      style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 200,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_forwarded,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    TextButton(
                      child: Text(
                        'ACİL ARAMA LİSTESİ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Arama()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future urlLauncher(String url) async {
  if (await launch(url)) {
    await launch(url);
  } else {
    debugPrint('Linki Açamadım');
  }
}
