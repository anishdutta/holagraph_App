import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album.dart';

class Services{
  static const String url = "https://bbuq4m2qf4.execute-api.ap-south-1.amazonaws.com/GetAllDataFromDynamoDb/common/dot";

  static Future<List<Album>> getRFID() async{
    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        List<Album> list = parseRFID(response.body);
        return list;
      }else{
        throw Exception('Error');
      }
    } catch (e){
      throw Exception(e.toString());
    }
  }
  static List<Album> parseRFID(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}