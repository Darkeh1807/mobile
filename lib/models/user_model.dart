class User {
    String? id;
    String? fullName;
    String? email;
    String? phone;
    String? profilePic;
    bool? isPhoneNumberVerified;
    bool? isEmailVerified;
    String? role;
    // DateTime? createdAt;
    // DateTime? updatedAt;
    // int? v;

    User({
        this.id,
        this.fullName,
        this.email,
        this.phone,
        this.profilePic,
        this.isPhoneNumberVerified,
        this.isEmailVerified,
        this.role,
     
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        profilePic: json["profilePic"],
        isPhoneNumberVerified: json["isPhoneNumberVerified"],
        isEmailVerified: json["isEmailVerified"],
        role: json["role"],
     
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "profilePic": profilePic,
        "isPhoneNumberVerified": isPhoneNumberVerified,
        "isEmailVerified": isEmailVerified,
        "role": role,
      
    };
}
