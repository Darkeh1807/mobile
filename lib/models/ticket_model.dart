


Ticket ticketFromJson(Map data) => Ticket.fromJson(data);

Map ticketToJson(Ticket data) => data.toJson();

class Ticket {
    final String? id;
    final Booking? booking;
    final String? qrCode;
    final String? user;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    Ticket({
        this.id,
        this.booking,
        this.qrCode,
        this.user,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Ticket.fromJson(Map<dynamic, dynamic> json) => Ticket(
        id: json["_id"],
        booking: json["Booking"] == null ? null : Booking.fromJson(json["Booking"]),
        qrCode: json["QRCode"],
        user: json["user"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "Booking": booking?.toJson(),
        "QRCode": qrCode,
        "user": user,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Booking {
    final String? id;
    final Trip? trip;
    final String? user;
    final String? status;
    final int? amount;
    final String? paymentStatus;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? paymentChannel;
    final DateTime? paymentDate;
    final String? paymentMethod;
    final String? paymentReference;
    final int? seatNumber;

    Booking({
        this.id,
        this.trip,
        this.user,
        this.status,
        this.amount,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.paymentChannel,
        this.paymentDate,
        this.paymentMethod,
        this.paymentReference,
        this.seatNumber,
    });

    factory Booking.fromJson(Map<dynamic, dynamic> json) => Booking(
        id: json["_id"],
        trip: json["Trip"] == null ? null : Trip.fromJson(json["Trip"]),
        user: json["User"],
        status: json["status"],
        amount: json["amount"],
        paymentStatus: json["paymentStatus"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        paymentChannel: json["paymentChannel"],
        paymentDate: json["paymentDate"] == null ? null : DateTime.parse(json["paymentDate"]),
        paymentMethod: json["paymentMethod"],
        paymentReference: json["paymentReference"],
        seatNumber: json["seatNumber"],
    );

    Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "Trip": trip?.toJson(),
        "User": user,
        "status": status,
        "amount": amount,
        "paymentStatus": paymentStatus,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "paymentChannel": paymentChannel,
        "paymentDate": paymentDate?.toIso8601String(),
        "paymentMethod": paymentMethod,
        "paymentReference": paymentReference,
        "seatNumber": seatNumber,
    };
}

class Trip {
    final List<dynamic>? slots;
    final String? id;
    final DateTime? date;
    final String? origin;
    final String? destination;
    final String? numberOfBusAssigned;
    final String? tripStatus;
    final String? tripType;
    final String? busCompany;
    final String? bus;
    final int? price;
    final String? createdBy;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final TimeScheduled? timeScheduled;

    Trip({
        this.slots,
        this.id,
        this.date,
        this.origin,
        this.destination,
        this.numberOfBusAssigned,
        this.tripStatus,
        this.tripType,
        this.busCompany,
        this.bus,
        this.price,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.timeScheduled,
    });

    factory Trip.fromJson(Map<dynamic, dynamic> json) => Trip(
        slots: json["slots"] == null ? [] : List<dynamic>.from(json["slots"]!.map((x) => x)),
        id: json["_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        origin: json["origin"],
        destination: json["destination"],
        numberOfBusAssigned: json["numberOfBusAssigned"],
        tripStatus: json["tripStatus"],
        tripType: json["tripType"],
        busCompany: json["busCompany"],
        bus: json["bus"],
        price: json["price"],
        createdBy: json["createdBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        timeScheduled: json["timeScheduled"] == null ? null : TimeScheduled.fromJson(json["timeScheduled"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "slots": slots == null ? [] : List<dynamic>.from(slots!.map((x) => x)),
        "_id": id,
        "date": date?.toIso8601String(),
        "origin": origin,
        "destination": destination,
        "numberOfBusAssigned": numberOfBusAssigned,
        "tripStatus": tripStatus,
        "tripType": tripType,
        "busCompany": busCompany,
        "bus": bus,
        "price": price,
        "createdBy": createdBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "timeScheduled": timeScheduled?.toJson(),
    };
}

class TimeScheduled {
    final String? startTime;
    final String? endTime;
    final String? id;

    TimeScheduled({
        this.startTime,
        this.endTime,
        this.id,
    });

    factory TimeScheduled.fromJson(Map<dynamic, dynamic> json) => TimeScheduled(
        startTime: json["startTime"],
        endTime: json["endTime"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "_id": id,
    };
}
