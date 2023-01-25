class UserModel {
  final String? token;
  final String? idMobile;
  final String? phoneId;
  final String? namaPengguna;
  final String? alamatPengguna;
  final String? kdKelurahan;
  final String? latitude;
  final String? longitude;
  final String? email;
  final String? userId;
  final String? userPassword;
  String? image = "";

  UserModel(
      {this.token,
      this.idMobile,
      this.phoneId,
      this.namaPengguna,
      this.alamatPengguna,
      this.kdKelurahan,
      this.latitude,
      this.longitude,
      this.email,
      this.userId,
      this.userPassword,
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        token: json["token"],
        idMobile: json["idMobile"],
        phoneId: json["phoneId"],
        namaPengguna: json["namaPengguna"],
        alamatPengguna: json["alamatPengguna"],
        kdKelurahan: json["kdKelurahan"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        email: json["email"],
        userId: json["userId"],
        userPassword: json["userPassword"],
        image: json["image"] == null || json["image"] == ""
            ? "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"
            : json["image"]);
  }

  Map<String, dynamic> toMap() => {
        "token": token,
        "idMobile": idMobile,
        "phoneId": phoneId,
        "namaPengguna": namaPengguna,
        "alamatPengguna": alamatPengguna,
        "kdKelurahan": kdKelurahan,
        "latitude": latitude,
        "longitude": longitude,
        "email": email,
        "userId": userId,
        "userPassword": userPassword,
        "image": image,
      };
}
