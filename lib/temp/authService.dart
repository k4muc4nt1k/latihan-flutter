import 'dart:async';
import 'dart:convert';
import 'package:latihan/model/loginModel.dart';
import 'package:latihan/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Map<String, dynamic>? lm;
  bool? status;

  // Login
  Future<bool?> isLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isLogin") == null) {
      return false;
    }
    return prefs.getBool("isLogin");
  }

  Future<void> setLogin(Map<String, dynamic> lms) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(lms));
    prefs.setBool("isLogin", true);
  }

  Future<LoginModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("user") == null) {
      return null;
    }
    return LoginModel.fromJson(json.decode(prefs.getString("user").toString()));
  }

  //Profile
  Future<void> setUserProfile(Map<String, dynamic> lms) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userProfile", json.encode(lms));
  }

  Future<UserModel?> getUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userProfile") == null) {
      return null;
    }
    return UserModel.fromJson(
        json.decode(prefs.getString("userProfile").toString()));
  }

  //Daftar (0/null:belum daftar, 1: sudah terdaftar, 2: phone available, 3: verifikasi match, 4: nama terisi, , 5: pin match)
  Future<void> setDaftar(Map<String, dynamic> lms, int status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("daftar", json.encode(lms));
    prefs.setInt("statusDaftar", status);
  }

  Future<void> setDaftarOnly(Map<String, dynamic> lms) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("daftar", json.encode(lms));
  }

  Future<void> setStatusDaftar(int status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("statusDaftar", status);
  }

  Future<Map<String, dynamic>?> getDaftar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("daftar") == null) {
      return null;
    }
    return json.decode(prefs.getString("daftar").toString());
  }

  Future<int?> getStatusDaftar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("statusDaftar") == null) {
      return 0;
    }
    return prefs.getInt("statusDaftar");
  }

  // Logout
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userProfile");
    prefs.remove("isLogin");
    prefs.remove("user");
    // Simulate a future for response after 1 second.
    return await new Future<void>.delayed(new Duration(seconds: 1));
  }
}
