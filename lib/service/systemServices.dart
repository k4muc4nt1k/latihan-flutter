

import 'dart:convert';

import 'package:latihan/service/network.dart';
import 'package:latihan/model/resultListModel.dart';
import 'package:latihan/service/networkCom.dart' as net;

Future<ResultListModel> login({Map<String, dynamic>? body}) async {
  String url = domain + "/login";

  if(body==null)
    body = {};

  dynamic jsonBody = json.encode(body);

  Map<String, String> header = new Map<String, String>();
  header["Accept"] = "application/json";
  header["Content-Type"] = "application/json";
  return net.POST(url: url, header: header, body: jsonBody);
}