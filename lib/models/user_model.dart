

User userFromJson(Map data) => User.fromJson(data);

Map userToJson(User data) => data.toJson();

class User {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? password = '';
  String? profilePic;
  bool? isPhoneNumberVerified;
  bool? isEmailVerified;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.password = '',
    this.profilePic,
    this.isPhoneNumberVerified,
    this.isEmailVerified,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"] ?? '',
        profilePic: json["profilePic"],
        isPhoneNumberVerified: json["isPhoneNumberVerified"],
        isEmailVerified: json["isEmailVerified"],
        role: json["role"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "profilePic": profilePic,
        "isPhoneNumberVerified": isPhoneNumberVerified,
        "isEmailVerified": isEmailVerified,
        "role": role,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
