class LoginModel {
  final int? userId;
  final String? token;
  final String? email;
  final String? password;

  LoginModel({this.userId, this.token, this.email, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userId: json['userId'],
      token: json['token'],
//      email: json['email']
    );
  }

  Map toResultMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;
    map["token"] = token;

    return map;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}
