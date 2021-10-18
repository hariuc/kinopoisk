import 'dart:convert';
import 'dart:io';

import 'package:kinopoisk/services/constants.dart';
import 'package:http/http.dart' as http;

class Utils {
  static Map<String, String> getHeaders() {
    var headers = {
      HttpHeaders.acceptCharsetHeader: 'application/json;utf-8',
      HttpHeaders.acceptEncodingHeader: 'utf-8',
      HttpHeaders.contentTypeHeader: 'application/json;charset=utf-8',
      'X-API-KEY': Constants.apiToken
    };

    return headers;
  }

  static Future<Map<String, dynamic>> getDataFromNet(
      {required String uriPath}) async {
    var headers = getHeaders();
    var url = Constants.mainServer + uriPath;
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {

       

      //final mapData = json.decode(response.body);
     
      final mapData = json.decode(const Utf8Decoder().convert(response.bodyBytes));
      return mapData;
    } else {
      throw Exception('Exception');
    }
  }

  static String parseCountryList({required List<dynamic> list}) {
    var strBuffer = StringBuffer();
    var countryLength = list.length;
    for (var i = 0; i < countryLength; i++) {
      strBuffer.write(list[i].country);
      if (i < countryLength - 1) {
        strBuffer.write(', ');
      }
    }
    return strBuffer.toString();
  }

  static String parseGenreList({required List<dynamic> list}) {
    var strBuffer = StringBuffer();
    var countryLength = list.length;
    for (var i = 0; i < countryLength; i++) {
      strBuffer.write(list[i].genre);
      if (i < countryLength - 1) {
        strBuffer.write(', ');
      }
    }
    return strBuffer.toString();
  }
}
