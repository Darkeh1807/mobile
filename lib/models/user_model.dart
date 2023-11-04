class User {
  late String? id;
  late String? fullName;
  late String? email;
  late String? phone;
  // late String? password;
  late String? profilePic;
  late bool? isPhoneNumberVerified;
  late bool? isEmailVerified;
  late String? role;

  User({
    this.id = '',
    this.fullName = '',
    this.email = '',
    this.phone = '',
    // this.password = '',
    this.profilePic = '',
    this.isPhoneNumberVerified = false,
    this.isEmailVerified = false,
    this.role = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      fullName: json["fullName"],
      email: json["email"],
      phone: json["phone"],
      // password: json["password"],
      profilePic: json["profilePic"],
      isPhoneNumberVerified: json["isPhoneNumberVerified"],
      isEmailVerified: json["isEmailVerified"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "fullName": fullName,
      "email": email,
      "phone": phone,
      // "password": password,
      "profilePic": profilePic,
      "isPhoneNumberVerified": isPhoneNumberVerified,
      "isEmailVerified": isEmailVerified,
      "role": role,
    };
  }
}
