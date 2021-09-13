import 'dart:convert';

import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:demo_flutter_project/models/entity/company_api.dart';
import 'package:http/http.dart' as http;

class CompanyRepositoryApi {
  static const API_KEY =
      "dj00aiZpPWdzTG5Nb0w4ZWFzZSZzPWNvbnN1bWVyc2VjcmV0Jng9MDc-";
  static const BASE_URL =
      "https://job.yahooapis.jp/v1/furusato/company/?results=10";

  Future<List<CompanyApi>> getCompanies() async {
    final url = Uri.parse(BASE_URL + "&appid=$API_KEY");
    http.Response response = await http.get(url);
    List<CompanyApi> result = [];
    if (response.statusCode == 200) {
      final responseBody = response.body;
      result = CompanyApiList.fromJson(jsonDecode(responseBody)).results;
    } else {
      throw Exception("Failed to load news");
    }
    for(var cs in result){
      print(cs.logoImgUrlSp);
    }
    return result;
  }
}
