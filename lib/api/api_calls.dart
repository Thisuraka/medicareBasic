import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'api_caller.dart';
import 'api_response.dart';

class ApiCalls {
  static Future<ApiResponse> predictMedicineFromSymptom(
      {required List<dynamic> symptoms}) async {
    try {
      var data = <String, dynamic>{};
      data['disease'] = 'symptoms';

      Map<String, String> headers = new Map();
      headers["Accept"] = "multipart/form-data";

      print(data);

      return ApiCaller.postRequest('/disease', data: data, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }
}
