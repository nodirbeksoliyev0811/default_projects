import 'dart:convert';
import 'package:default_project/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../models/Preyer Info/prayer_info_model.dart';
import '../models/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> getAllCurrencies(String region) async {
    Uri uri = Uri.parse("${BaseUrl().baseUrl}/api/present/day?region=$region");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data:  PrayerInfoModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }
}
