import 'dart:convert';
import 'package:http/http.dart' as http;

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '372FDD60-8769-4E98-83BD-7EFA0F558341';


class CoinData{
  Future<String> getCoinData(String Cryptocurrency, String Fiatcurrency) async {
    String requestURL = '$coinAPIURL/$Cryptocurrency/$Fiatcurrency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      String value = lastPrice.toStringAsFixed(0);
      return value;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}