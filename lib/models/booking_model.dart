Booking bookingFromJson(Map data) => Booking.fromJson(data);

Map bookingToJson(Booking data) => data.toJson();

class Booking {
    BookingClass booking;
    PaymentUrl paymentUrl;

    Booking({
        required this.booking,
        required this.paymentUrl,
    });

    factory Booking.fromJson(Map<dynamic, dynamic> json) => Booking(
        booking: BookingClass.fromJson(json["booking"]),
        paymentUrl: PaymentUrl.fromJson(json["paymentUrl"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "booking": booking.toJson(),
        "paymentUrl": paymentUrl.toJson(),
    };
}

class BookingClass {
    String trip;
    String user;
    String status;
    int amount;
    String paymentStatus;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    BookingClass({
        required this.trip,
        required this.user,
        required this.status,
        required this.amount,
        required this.paymentStatus,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory BookingClass.fromJson(Map<dynamic, dynamic> json) => BookingClass(
        trip: json["Trip"],
        user: json["User"],
        status: json["status"],
        amount: json["amount"],
        paymentStatus: json["paymentStatus"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<dynamic, dynamic> toJson() => {
        "Trip": trip,
        "User": user,
        "status": status,
        "amount": amount,
        "paymentStatus": paymentStatus,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class PaymentUrl {
    bool status;
    String message;
    Data data;

    PaymentUrl({
        required this.status,
        required this.message,
        required this.data,
    });

    factory PaymentUrl.fromJson(Map<dynamic, dynamic> json) => PaymentUrl(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String authorizationUrl;
    String accessCode;
    String reference;

    Data({
        required this.authorizationUrl,
        required this.accessCode,
        required this.reference,
    });

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        authorizationUrl: json["authorization_url"],
        accessCode: json["access_code"],
        reference: json["reference"],
    );

    Map<dynamic, dynamic> toJson() => {
        "authorization_url": authorizationUrl,
        "access_code": accessCode,
        "reference": reference,
    };
}
