class WorldTimeModel{
  String? dateTime;
  String? timeZone;
  String? offset;

  WorldTimeModel.fromJson(Map<String, dynamic> a) {
   dateTime =  a["utc_datetime"];
   timeZone = a["timezone"];
   offset = a["utc_offset"];
  }


}