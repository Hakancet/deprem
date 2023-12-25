import 'package:deprem/deprem/DepremDart.dart';
import 'package:deprem/deprem/DepremService.dart';
import 'package:flutter/material.dart';

class DepremPage extends StatefulWidget {
  const DepremPage({Key? key}) : super(key: key);

  @override
  State<DepremPage> createState() => _DepremPageState();
}
class _DepremPageState extends State<DepremPage> {
  List<Earthquakes> earthquakes = [];

  @override
  void initState() {
    super.initState();
    _fetchEarthquakes();
  }
  Future<void> _fetchEarthquakes() async {
    final List<Earthquakes>? fetchedEarthquakes = await DepremService.getDeprem();

    setState(() {
      earthquakes = fetchedEarthquakes ?? [];
    });
  }
  Future<void> _refreshData() async {
    await _fetchEarthquakes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(child: Text('Son Depremler')),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Center(
          child: ListView.builder(
            itemCount: earthquakes.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(earthquakes[index].city.toString()),
                      title: Text(earthquakes[index].location.toString()),
                      subtitle: Text(earthquakes[index].date.toString()),
                      trailing: Text(earthquakes[index].time.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((earthquakes[index].mag.toString())),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
