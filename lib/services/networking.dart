import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';
import 'package:clima_flutter/utilities/constants.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    var decodedData = jsonDecode(response.body);
    return decodedData;
  }
}
