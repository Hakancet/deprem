import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DepremDart.dart';



class DepremService {
  static DepremService _singleton = DepremService._iternal();
  DepremService._iternal();


  factory DepremService(){
    return _singleton;
  }

  static Future<List<Earthquakes>?> getDeprem() async{
    final url = Uri.parse('https://api.hknsoft.com/earthquake/v1/last24hours') ;
    final response = await http.get(url);


    if (response.body.isNotEmpty){
      final responseJson = json.decode(response.body);
      Deprem news = Deprem.fromJson(responseJson);
      return news.earthquakes;
    }
    return null;
  }
}