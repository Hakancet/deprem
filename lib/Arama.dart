import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Arama extends StatefulWidget {
  const Arama({Key? key}) : super(key: key);

  @override
  State<Arama> createState() => _AramaState();
}

class _AramaState extends State<Arama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Acil Aramalar'),
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
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.phone_forwarded,
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
                      urlLauncher('tel:122');
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
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.phone_forwarded,
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
                      urlLauncher('tel:08503802577');
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
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.phone_forwarded,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                    child: const Text(
                      'KIZILAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      urlLauncher('tel:168');
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
Future urlLauncher(String url) async {
  if (await launch(url)) {
    await launch(url);
  } else {
    debugPrint('Linki Açamadım');
  }
}