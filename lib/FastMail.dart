import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart' as loc;

class FastMail extends StatefulWidget {
  const FastMail({Key? key}) : super(key: key);

  @override
  State<FastMail> createState() => _FastMailState();
}

class _FastMailState extends State<FastMail> {
  final loc.Location location = loc.Location();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Hızlı Mail'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(
            height: 15,
            color: Colors.red,
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.mail,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                    child: const Text(
                      'AFAD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      mailAc('mailto:basin.halklailiskiler@afad.gov.tr?subject=$location&subject=ACİL%20YARDIMA%20İHTİYACIM%20VAR');
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 15,
            color: Colors.red,
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.mail,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                    child: const Text(
                      'AKUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      mailAc('mailto:	info@akut.org.tr?subject=$location&subject=ACİL%20YARDIMA%20İHTİYACIM%20VAR');
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 15,
            color: Colors.red,
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.mail,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                    child: const Text(
                      'İHH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      mailAc('mailto:	info@ihh.org.tr?subject=$location&subject=ACİL%20YARDIMA%20İHTİYACIM%20VAR');
                    },
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
Future mailAc (String url) async{
  if (await launch(url)) {
    await launch(url);
  } else{
    debugPrint ('Link Çalışmıyor');
  }
}