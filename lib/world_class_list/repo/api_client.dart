class Success{
  int? code;
  Object? response;
  Success({this.code, this.response});
}

class Failure{
  int? code;
  Object? errorResponse;
  Failure({this.code, this.errorResponse});
}


class ServerResponse{
  int? code;
  String msg;
  bool success;
  dynamic data;

  ServerResponse({this.code, required this.msg, required this.success, this.data});
}