BookedTrip bookedTripFromJson(Map data) => BookedTrip.fromJson(data);

class BookedTrip {
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

    BookedTrip({
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

    factory BookedTrip.fromJson(Map<dynamic, dynamic> json) => BookedTrip(
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
    final Destination? origin;
    final Destination? destination;
    final String? numberOfBusAssigned;
    final String? tripStatus;
    final String? tripType;
    final BusCompany? busCompany;
    final Bus? bus;
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
        origin: json["origin"] == null ? null : Destination.fromJson(json["origin"]),
        destination: json["destination"] == null ? null : Destination.fromJson(json["destination"]),
        numberOfBusAssigned: json["numberOfBusAssigned"],
        tripStatus: json["tripStatus"],
        tripType: json["tripType"],
        busCompany: json["busCompany"] == null ? null : BusCompany.fromJson(json["busCompany"]),
        bus: json["bus"] == null ? null : Bus.fromJson(json["bus"]),
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
        "origin": origin?.toJson(),
        "destination": destination?.toJson(),
        "numberOfBusAssigned": numberOfBusAssigned,
        "tripStatus": tripStatus,
        "tripType": tripType,
        "busCompany": busCompany?.toJson(),
        "bus": bus?.toJson(),
        "price": price,
        "createdBy": createdBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "timeScheduled": timeScheduled?.toJson(),
    };
}

class Bus {
    final String? id;
    final String? vehicleNumber;
    final String? model;
    final int? yearOfMake;
    final String? colour;
    final int? numberOfSeats;
    final String? status;
    final String? insurance;
    final String? roadWorthy;
    final String? createdBy;
    final String? busCompany;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    Bus({
        this.id,
        this.vehicleNumber,
        this.model,
        this.yearOfMake,
        this.colour,
        this.numberOfSeats,
        this.status,
        this.insurance,
        this.roadWorthy,
        this.createdBy,
        this.busCompany,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Bus.fromJson(Map<dynamic, dynamic> json) => Bus(
        id: json["_id"],
        vehicleNumber: json["vehicleNumber"],
        model: json["model"],
        yearOfMake: json["yearOfMake"],
        colour: json["colour"],
        numberOfSeats: json["numberOfSeats"],
        status: json["status"],
        insurance: json["insurance"],
        roadWorthy: json["roadWorthy"],
        createdBy: json["createdBy"],
        busCompany: json["busCompany"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "vehicleNumber": vehicleNumber,
        "model": model,
        "yearOfMake": yearOfMake,
        "colour": colour,
        "numberOfSeats": numberOfSeats,
        "status": status,
        "insurance": insurance,
        "roadWorthy": roadWorthy,
        "createdBy": createdBy,
        "busCompany": busCompany,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class BusCompany {
    final String? id;
    final String? name;
    final String? mobileNumber;
    final String? email;
    final List<String>? users;
    final String? companyDocuments;
    final List<String>? buses;
    final List<String>? drivers;
    final List<dynamic>? trips;
    final List<dynamic>? bookings;
    final String? status;
    final int? v;
    final List<Social>? socials;
    final String? tagline;
    final String? logo;
    final String? contactPersonEmail;
    final String? contactPersonName;
    final String? contactPersonPosition;
    final String? contactPersonPhone;

    BusCompany({
        this.id,
        this.name,
        this.mobileNumber,
        this.email,
        this.users,
        this.companyDocuments,
        this.buses,
        this.drivers,
        this.trips,
        this.bookings,
        this.status,
        this.v,
        this.socials,
        this.tagline,
        this.logo,
        this.contactPersonEmail,
        this.contactPersonName,
        this.contactPersonPosition,
        this.contactPersonPhone,
    });

    factory BusCompany.fromJson(Map<dynamic, dynamic> json) => BusCompany(
        id: json["_id"],
        name: json["name"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        users: json["users"] == null ? [] : List<String>.from(json["users"]!.map((x) => x)),
        companyDocuments: json["companyDocuments"],
        buses: json["Buses"] == null ? [] : List<String>.from(json["Buses"]!.map((x) => x)),
        drivers: json["Drivers"] == null ? [] : List<String>.from(json["Drivers"]!.map((x) => x)),
        trips: json["Trips"] == null ? [] : List<dynamic>.from(json["Trips"]!.map((x) => x)),
        bookings: json["Bookings"] == null ? [] : List<dynamic>.from(json["Bookings"]!.map((x) => x)),
        status: json["status"],
        v: json["__v"],
        socials: json["socials"] == null ? [] : List<Social>.from(json["socials"]!.map((x) => Social.fromJson(x))),
        tagline: json["tagline"],
        logo: json["logo"],
        contactPersonEmail: json["contactPersonEmail"],
        contactPersonName: json["contactPersonName"],
        contactPersonPosition: json["contactPersonPosition"],
        contactPersonPhone: json["contactPersonPhone"],
    );

    Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "mobileNumber": mobileNumber,
        "email": email,
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x)),
        "companyDocuments": companyDocuments,
        "Buses": buses == null ? [] : List<dynamic>.from(buses!.map((x) => x)),
        "Drivers": drivers == null ? [] : List<dynamic>.from(drivers!.map((x) => x)),
        "Trips": trips == null ? [] : List<dynamic>.from(trips!.map((x) => x)),
        "Bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x)),
        "status": status,
        "__v": v,
        "socials": socials == null ? [] : List<dynamic>.from(socials!.map((x) => x.toJson())),
        "tagline": tagline,
        "logo": logo,
        "contactPersonEmail": contactPersonEmail,
        "contactPersonName": contactPersonName,
        "contactPersonPosition": contactPersonPosition,
        "contactPersonPhone": contactPersonPhone,
    };
}

class Social {
    final String? name;
    final String? link;
    final String? id;

    Social({
        this.name,
        this.link,
        this.id,
    });

    factory Social.fromJson(Map<dynamic, dynamic> json) => Social(
        name: json["name"],
        link: json["link"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "_id": id,
    };
}

class Destination {
    final String? id;
    final String? country;
    final String? name;
    final String? createdBy;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    Destination({
        this.id,
        this.country,
        this.name,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Destination.fromJson(Map<dynamic, dynamic> json) => Destination(
        id: json["_id"],
        country: json["country"],
        name: json["name"],
        createdBy: json["createdBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "country": country,
        "name": name,
        "createdBy": createdBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
