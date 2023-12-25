import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class EczanePage extends StatefulWidget {
  @override
  _EczanePageState createState() => _EczanePageState();
}

class _EczanePageState extends State<EczanePage> {
  List<dynamic> EczaneData = [];
  List<dynamic> Filtre = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController ilController = TextEditingController();

  Future<void> EczaneVeri(String il) async {
    if (il != null && il.isNotEmpty) {
      var apiUrl = 'https://api.collectapi.com/health/dutyPharmacy?il=$il';
      var apiKey = '3TodEZv9iU6T7IC2QxoXPX:11M9UwkE29cH4IMVtjAOBw';

      var headers = {
        'content-type': 'application/json',
        'authorization': 'apikey $apiKey',
      };
      var response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          setState(() {
            EczaneData = data['result'] ?? [];
            Filtre = EczaneData;
          });
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Hata'),
              content: Text('API isteği başarısız oldu.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Tamam'),
                ),
              ],
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Hata'),
            content: Text('API isteği başarısız oldu.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Tamam'),
              ),
            ],
          ),
        );
      }
    }
  }

  void EczaneFiltre(String query) {
    setState(() {
      if (query.isEmpty) {
        Filtre = EczaneData;
      } else {
        Filtre = EczaneData.where((eczane) {
          return eczane['dist'].toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void EczaneArama() {
    String query = searchController.text;
    EczaneFiltre(query);
  }

  void EczaneSehir() {
    String il = ilController.text;
    if (il != null && il.isNotEmpty) {
      EczaneVeri(il);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata'),
          content: Text('Lütfen bir il girin.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Center(child: Text('Nöbetçi Eczane')),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: ilController,
                decoration: InputDecoration(
                  labelText: 'İl Girin',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Card(
              color: Colors.orangeAccent,
              child: TextButton(
                onPressed: EczaneSehir,
                child: Text('Eczane Ara' , style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: searchController,
                onChanged: (value) => EczaneArama(),
                decoration: InputDecoration(
                  labelText: 'İlçe Gir',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Filtre.length,
                itemBuilder: (context, index) {
                  var pharmacy = Filtre[index];
                  return ListTile(
                    title: Text(pharmacy['name'] ?? ''),
                    subtitle: Text(pharmacy['address'] ?? ''),
                    leading: Text(pharmacy['dist'] ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
