class ResultListModel {
  final int? code;
  final String? message;
  dynamic data;
  ResultListModel({this.code, this.message, this.data});
  factory ResultListModel.fromJson(Map<String, dynamic> json) {
    return ResultListModel(
        code: json['code'], message: json['message'], data: json['data']);
  }
}
