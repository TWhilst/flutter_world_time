import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/world_class_list/model/time_model.dart';
import 'package:untitled2/world_class_list/view_model/view_model.dart';

class DetailModel {
  String? country;
  String? flag;
  String? datetime;
  String? url;
  String? continent;
  String? city;
  String? offset;
  

  DetailModel({this.country, this.datetime, this.flag, this.city, this.continent, this.url, this.offset});

  List<DetailModel> _details = [];

  List<DetailModel> getDetails() {
    final List<String> _image = [
      "https://flagpedia.net/data/flags/h80/ng.webp",
      "https://flagpedia.net/data/flags/h80/bw.webp",
      "https://flagpedia.net/data/flags/h80/sn.webp",
      "https://flagpedia.net/data/flags/h80/ug.webp",
      "https://flagpedia.net/data/flags/h80/at.webp",
      "https://flagpedia.net/data/flags/h80/gb-eng.webp",
      "https://flagpedia.net/data/flags/h80/ie.webp",
      "https://flagpedia.net/data/flags/h80/no.webp",
      "https://flagpedia.net/data/flags/h80/nu.webp",
      "https://flagpedia.net/data/flags/h80/cn.webp",
      "https://flagpedia.net/data/flags/h80/jp.webp",
      "https://flagpedia.net/data/flags/h80/ru.webp",
      "https://flagpedia.net/data/flags/h80/us.webp",
    ];

    List<DetailModel> dItems = [
      DetailModel(country: "Nigeria", flag: _image[0], datetime: "", offset: "", city: "Lagos", continent: "Africa", url: "Africa/Lagos"),
      DetailModel(country: "Botswana", flag: _image[1],datetime: "", offset: "", city: "Gaborone", continent: "Africa", url: "Africa/Gaborone"),
      DetailModel(country: "Senegal", flag: _image[2],datetime: "", offset: "", city: "Dakar", continent: "Africa", url: "Africa/Dakar"),
      DetailModel(country: "Uganda", flag: _image[3],datetime: "", offset: "", city: "Kampala", continent: "Africa", url: "Africa/Kampala"),
      DetailModel(country: "Austria", flag: _image[4],datetime: "", offset: "", city: "Vienna", continent: "Europe", url: "Europe/Vienna"),
      DetailModel(country: "England", flag: _image[5],datetime: "", offset: "", city: "London", continent: "Europe", url: "Europe/London"),
      DetailModel(country: "Ireland", flag: _image[6],datetime: "", offset: "", city: "Dublin", continent: "Europe", url: "Europe/Dublin"),
      DetailModel(country: "Norway", flag: _image[7],datetime: "", offset: "", city: "Oslo", continent: "Europe", url: "Europe/Oslo"),
      DetailModel(country: "Niue", flag: _image[8],datetime: "", offset: "", city: "Alofi", continent: "Pacific", url: "Pacific/Niue"),
      DetailModel(country: "China", flag: _image[9],datetime: "", offset: "", city: "Shanghai", continent: "Asia", url: "Asia/Shanghai"),
      DetailModel(country: "Japan", flag: _image[10],datetime: "", offset: "", city: "Tokyo", continent: "Asia", url: "Asia/Tokyo"),
      DetailModel(country: "Russia", flag: _image[11],datetime: "", offset: "", city: "Anadyr", continent: "Asia", url: "Europe/Kaliningrad"),
      DetailModel(country: "America", flag: _image[12],datetime: "", offset: "", city: "New York", continent: "America", url: "America/New_York"),
    ];
    return dItems;
  }

 List<DetailModel> updateDetails(var time, var offset, int index) {
    _details = getDetails();
    var datetime = DateTime.parse(time.toString());
    var add = offset.substring(1,3);
    datetime = datetime.add(Duration(hours: int.parse(add)));
    var finalDate = DateFormat.Hm().format(datetime);
    _details[index].datetime = finalDate;
    _details[index].offset = offset;
    return _details;
  }

  getUpdates(int index) {
    _details[index];
  }


}