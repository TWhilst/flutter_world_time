import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:untitled2/constants.dart';
import 'package:untitled2/world_class_list/model/detail_model.dart';
import 'package:untitled2/world_class_list/model/time_model.dart';
import 'package:untitled2/world_class_list/repo/api_client.dart';

class WorldTimeServices{

  static Future<Object> getData() async {
    try {
      var url = Uri.parse(Constants.worldTimeUrl);
      var response = await http.get(url);
      if(response.statusCode == 200) {
        print(response.body);
        return Success(code: 200, response: WorldTimeModel.fromJson(jsonDecode(response.body)));
      }else {
        return Failure(code: Constants.invalidResponse, errorResponse: "Invalid Response");
      }
    }
    on HttpException {
      throw Failure(code: Constants.noInternet, errorResponse: "No Internet");
    }
    on FormatException {
      throw Failure(code: Constants.invalidFormat, errorResponse: "Invalid Format");
    }
    catch(e) {
      throw  Failure(code: Constants.unknownError, errorResponse: "Unknown Error");
    }
  }

  static Future<Object> getWorldData(int index,) async {
    DetailModel detailModel = DetailModel();
    String linkUrl = detailModel.getDetails()[index].url!;
    String worldTimeUrl = "http://worldtimeapi.org/api/timezone/$linkUrl";
    dynamic list =[];
    try {
      var url = Uri.parse(worldTimeUrl);
      var response = await http.get(url);
      if(response.statusCode == 200) {
        print(response.body);
        return Success(code: 200, response: WorldTimeModel.fromJson(jsonDecode(response.body)));
      }else {
        return Failure(code: Constants.invalidResponse, errorResponse: "Invalid Response");
      }
    }
    on HttpException {
      return Failure(code: Constants.noInternet, errorResponse: "No Internet");
    }
    on FormatException {
      return Failure(code: Constants.invalidFormat, errorResponse: "Invalid Format");
    }
    catch(e) {
      return Failure(code: Constants.unknownError, errorResponse: "Unknown Error");
    }
  }



}