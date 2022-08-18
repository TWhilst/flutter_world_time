import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/world_class_list/model/detail_model.dart';
import 'package:untitled2/world_class_list/model/time_model.dart';
import 'package:untitled2/world_class_list/model/world_class_error.dart';
import 'package:untitled2/world_class_list/repo/api_client.dart';
import 'package:untitled2/world_class_list/repo/world_time_services.dart';

class WorldTimeViewModel extends ChangeNotifier{
  bool _isLoading = false;
  WorldTimeModel? _timeModel;
  WorldTimeModel? _worldTime;
  WorldClassError? _classError;
  List<DetailModel> _worldTimeDetails = [];
  bool _selected = false;
  DetailModel? _detailModel;
  bool _isDayTime = true;
  String? _time;

  bool get isLoading => _isLoading;
  WorldTimeModel get timeModel => _timeModel!;
  WorldClassError? get classError => _classError;
  bool get selected => _selected;
  List<DetailModel> get worldTimeDetails => _worldTimeDetails;
  DetailModel get detailModel => _detailModel!;
  bool get isDayTime => _isDayTime;
  String get time => _time!;

  WorldTimeViewModel() {
    getData();
  }

  loadingData(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  selectedData(bool selected) {
    _selected = selected;
  }

  setTimeModel(WorldTimeModel timeModel) {
    _timeModel = timeModel;
  }

  setWorldTime(WorldTimeModel worldTime) {
     _worldTime = worldTime;
  }

  setWorldClassError(WorldClassError classError) {
    _classError = classError;
  }

  setWorldTimeDetails(List<DetailModel> worldTimeDetails) {
    _worldTimeDetails = [];
    _worldTimeDetails = worldTimeDetails;
  }

  setDetailModel(DetailModel detailModel) {
    _detailModel = detailModel;
  }

  // setIsDayTime(var time, String offset) {
  //   var datetime = DateTime.parse(time);
  //   var dOffset = offset.substring(1, 3);
  //   datetime.add(Duration(hours: int.parse(dOffset)));
  //   if(datetime.hour > 6 && datetime.hour < 20){
  //     return _isDayTime = true;
  //   }
  //   return _isDayTime = false;
  // }
  //
  // setIsDayTime2() {
  //   if(_selected == true){
  //     DateTime time = DateTime.parse(detailModel.datetime!);
  //     if(time.hour > 6 && time.hour < 20){
  //       return _isDayTime = true;
  //     }
  //     notifyListeners();
  //     return _isDayTime = false;
  //   }
  // }

  getData() async {
    loadingData(true);
    var response = await WorldTimeServices.getData();
    if(response is Success) {
      setTimeModel(response.response as WorldTimeModel);
      List<DetailModel> worldTimeDetails= DetailModel().getDetails();
      setWorldTimeDetails(worldTimeDetails);
    }
    if(response is Failure) {
      WorldClassError classError = WorldClassError(code: response.code, message: response.errorResponse);
      setWorldClassError(classError);
    }
    // setIsDayTime(_timeModel!.dateTime, _timeModel!.offset!);
    loadingData(false);
  }

  getWorldData(int index,) async {
    // loadingData(true);
    loadingData(true);
    var response = await WorldTimeServices.getWorldData(index);

    if(response is Success) {
      setWorldTime(response.response as WorldTimeModel);
      getDetails(index);
    }
    if(response is Failure) {
      WorldClassError classError = WorldClassError(code: response.code, message: response.errorResponse);
      setWorldClassError(classError);
    }
    loadingData(false);
    // loadingData(false);
  }

  getDetails(int index) {
    selectedData(true);
    if(_worldTime!.dateTime != null || _worldTime!.offset != null) {
      var time = _worldTime!.dateTime;
      print(time);
      var offset = _worldTime!.offset;
      List<DetailModel> worldTimeDetails = DetailModel().updateDetails(time, offset, index);
      print(worldTimeDetails[index].datetime);
      DetailModel detailModel = worldTimeDetails[index];
      setDetailModel(detailModel);
      // selectedData(false);
    }
  }

  // setTime() {
  //   if(_selected == true) {
  //     if(_detailModel!.datetime!.isNotEmpty){
  //       DateTime time = DateTime.parse(_detailModel!.datetime!);
  //       _time = DateFormat.Hm().format(time);
  //     }
  //   }
  //
  // }



}