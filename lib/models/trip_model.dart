

Trip tripFromJson(Map data) => Trip.fromJson(data);

Map tripToJson(Trip data) => data.toJson();

class Trip {
    String? id;
    DateTime? date;
    Destination? origin;
    Destination? destination;
    String? numberOfBusAssigned;
    String? tripStatus;
    String? tripType;
    BusCompany? busCompany;
    Bus? bus;
    int? price;
    String? createdBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    TimeScheduled? timeScheduled;

    Trip({
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
    String? id;
    String? vehicleNumber;
    String? model;
    int? yearOfMake;
    String? colour;
    String? numberOfSeats;
    String? status;
    String? insurance;
    String? roadWorthy;
    String? createdBy;
    String? busCompany;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

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
    String? id;
    String? name;
    String? mobileNumber;
    String? email;
    List<dynamic>? users;
    String? companyDocuments;
    List<String>? buses;
    List<String>? drivers;
    List<dynamic>? trips;
    List<dynamic>? bookings;
    String? status;
    int? v;

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
    });

    factory BusCompany.fromJson(Map<dynamic, dynamic> json) => BusCompany(
        id: json["_id"],
        name: json["name"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        users: json["users"] == null ? [] : List<dynamic>.from(json["users"]!.map((x) => x)),
        companyDocuments: json["companyDocuments"],
        buses: json["Buses"] == null ? [] : List<String>.from(json["Buses"]!.map((x) => x)),
        drivers: json["Drivers"] == null ? [] : List<String>.from(json["Drivers"]!.map((x) => x)),
        trips: json["Trips"] == null ? [] : List<dynamic>.from(json["Trips"]!.map((x) => x)),
        bookings: json["Bookings"] == null ? [] : List<dynamic>.from(json["Bookings"]!.map((x) => x)),
        status: json["status"],
        v: json["__v"],
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
    };
}

class Destination {
    String? id;
    String? country;
    String? name;
    String? createdBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

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
    String? startTime;
    String? endTime;
    String? id;

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

    Map<dynamic, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "_id": id,
    };
}
