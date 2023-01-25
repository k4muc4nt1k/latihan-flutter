import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:latihan/model/resultListModel.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

// final HttpClient client = new HttpClient();

// ignore: non_constant_identifier_names
Future<ResultListModel> GET(
    {required String url, Map<String, String>? header}) async {
  Uri uri = Uri.parse(url);
  // client.connectionTimeout = const Duration(seconds: 5);
  
  return get(uri, headers: header).timeout(const Duration(seconds: 10),
    onTimeout: () {
    // print("error connection");
      return Response('The connection has timed out, Please try again!', 408);
      // throw TimeoutException('The connection has timed out, Please try again!');
    },)
      .then((Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      var resp = {"code": statusCode, "message": response.body};
      return ResultListModel.fromJson(resp);
    }
    return ResultListModel.fromJson(json.decode(response.body));
  }, onError: (error) {
    if (error.toString().contains("Connection failed"))
      return ResultListModel.fromJson({
        "code": 0,
        "message": """Koneksi Gagal
  Cek koneksi internet anda!"""
      });
    else
      return ResultListModel.fromJson({"code": 0, "message": error.toString()});
  });
}

// ignore: non_constant_identifier_names
Future<ResultListModel> POST(
    {required String url, Map<String, String>? header, dynamic body}) async {
  Uri uri = Uri.parse(url);
  return post(uri, headers: header, body: body).then((Response response) {
    print(response.statusCode);
    print(response.headers);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      var resp = {"code": statusCode, "message": response.body};
      return ResultListModel.fromJson(resp);
    }
    return ResultListModel.fromJson(json.decode(response.body));
  }, onError: (error) {
    if (error.toString().contains("Connection failed"))
      return ResultListModel.fromJson({
        "code": 404,
        "message": """Koneksi Gagal
       Cek koneksi internet anda!"""
      });
    else
      return ResultListModel.fromJson({"code": 0, "message": error.toString()});
  });
}

// ignore: non_constant_identifier_names
Future<ResultListModel> PUT(
    {required String url, Map<String, String>? header, dynamic body}) async {
  Uri uri = Uri.parse(url);
  return put(uri, headers: header, body: body).then((Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      var resp = {"code": statusCode, "message": response.body};
      return ResultListModel.fromJson(resp);
    }
    return ResultListModel.fromJson(json.decode(response.body));
  }, onError: (error) {
    if (error.toString().contains("Connection failed"))
      return ResultListModel.fromJson({
        "code": 0,
        "message": """Koneksi Gagal
  Cek koneksi internet anda!"""
      });
    else
      return ResultListModel.fromJson({"code": 0, "message": error.toString()});
  });
}

// ignore: non_constant_identifier_names
Future<ResultListModel> DELETE(
    {required String url, Map<String, String>? header}) async {
  Uri uri = Uri.parse(url);
  return delete(uri, headers: header).then((Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      var resp = {"code": statusCode, "message": response.body};
      return ResultListModel.fromJson(resp);
    }
    return ResultListModel.fromJson(json.decode(response.body));
  }, onError: (error) {
    if (error.toString().contains("Connection failed"))
      return ResultListModel.fromJson({
        "code": 0,
        "message": """Koneksi Gagal
  Cek koneksi internet anda!"""
      });
    else
      return ResultListModel.fromJson({"code": 0, "message": error.toString()});
  });
}

// ignore: missing_return
Future<ResultListModel> postFile(
    {required String url,
    required Map<String, String> header,
    dynamic body,
    required File file}) async {
  Uri uri = Uri.parse(url);
  // ignore: deprecated_member_use
  var stream = new ByteStream(DelegatingStream.typed(file.openRead()));
  var length = await file.length();

  var request = new MultipartRequest("POST", uri);
  request.headers.addAll(header);
  var multipartFile =
      new MultipartFile('file', stream, length, filename: basename(file.path));
  request.files.add(multipartFile);
  StreamedResponse response = await request.send();
  int statusCode = 400;
  dynamic values = "";
  response.stream.transform(utf8.decoder).listen((value) {
    statusCode = response.statusCode;
    values = value;
  }, onError: (error) {
    if (error.toString().contains("Connection failed"))
      return ResultListModel.fromJson({
        "code": 0,
        "message": """Koneksi Gagal
  Cek koneksi internet anda!"""
      });
    else
      return ResultListModel.fromJson({"code": 0, "message": error.toString()});
  });
  if (statusCode < 200 || statusCode > 400 || json == null) {
    return ResultListModel.fromJson({"code": statusCode, "message": values});
  }
  return ResultListModel.fromJson(json.decode(values));
}
