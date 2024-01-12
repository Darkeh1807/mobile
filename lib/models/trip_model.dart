Trip tripFromJson(Map data) => Trip.fromJson(data);

Map tripToJson(Trip data) => data.toJson();

class Trip {
  List<dynamic> slots;
  String id;
  DateTime date;
  Destination origin;
  Destination destination;
  String numberOfBusAssigned;
  String tripStatus;
  String tripType;
  BusCompany busCompany;
  Bus bus;
  int price;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  TimeScheduled timeScheduled;

  Trip({
    required this.slots,
    required this.id,
    required this.date,
    required this.origin,
    required this.destination,
    required this.numberOfBusAssigned,
    required this.tripStatus,
    required this.tripType,
    required this.busCompany,
    required this.bus,
    required this.price,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.timeScheduled,
  });

  factory Trip.fromJson(Map<dynamic, dynamic> json) => Trip(
        slots: List<dynamic>.from(json["slots"].map((x) => x)),
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        origin: Destination.fromJson(json["origin"]),
        destination: Destination.fromJson(json["destination"]),
        numberOfBusAssigned: json["numberOfBusAssigned"],
        tripStatus: json["tripStatus"],
        tripType: json["tripType"],
        busCompany: BusCompany.fromJson(json["busCompany"]),
        bus: Bus.fromJson(json["bus"]),
        price: json["price"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        timeScheduled: TimeScheduled.fromJson(json["timeScheduled"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "slots": List<dynamic>.from(slots.map((x) => x)),
        "_id": id,
        "date": date.toIso8601String(),
        "origin": origin.toJson(),
        "destination": destination.toJson(),
        "numberOfBusAssigned": numberOfBusAssigned,
        "tripStatus": tripStatus,
        "tripType": tripType,
        "busCompany": busCompany.toJson(),
        "bus": bus.toJson(),
        "price": price,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "timeScheduled": timeScheduled.toJson(),
      };
}

class Bus {
  String id;
  String vehicleNumber;
  String model;
  int yearOfMake;
  String colour;
  int numberOfSeats;
  String status;
  String insurance;
  String roadWorthy;
  String createdBy;
  String busCompany;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Bus({
    required this.id,
    required this.vehicleNumber,
    required this.model,
    required this.yearOfMake,
    required this.colour,
    required this.numberOfSeats,
    required this.status,
    required this.insurance,
    required this.roadWorthy,
    required this.createdBy,
    required this.busCompany,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class BusCompany {
  String id;
  String name;
  String mobileNumber;
  String email;
  List<String> users;
  String companyDocuments;
  List<String> buses;
  List<String> drivers;
  List<dynamic> trips;
  List<dynamic> bookings;
  String status;
  int v;
  List<Social> socials;
  String tagline;
  String logo;
  String contactPersonEmail;
  String contactPersonName;
  String contactPersonPosition;
  String contactPersonPhone;

  BusCompany({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.users,
    required this.companyDocuments,
    required this.buses,
    required this.drivers,
    required this.trips,
    required this.bookings,
    required this.status,
    required this.v,
    required this.socials,
    required this.tagline,
    required this.logo,
    required this.contactPersonEmail,
    required this.contactPersonName,
    required this.contactPersonPosition,
    required this.contactPersonPhone,
  });

  factory BusCompany.fromJson(Map<dynamic, dynamic> json) => BusCompany(
        id: json["_id"],
        name: json["name"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        users: List<String>.from(json["users"].map((x) => x)),
        companyDocuments: json["companyDocuments"],
        buses: List<String>.from(json["Buses"].map((x) => x)),
        drivers: List<String>.from(json["Drivers"].map((x) => x)),
        trips: List<dynamic>.from(json["Trips"].map((x) => x)),
        bookings: List<dynamic>.from(json["Bookings"].map((x) => x)),
        status: json["status"],
        v: json["__v"],
        socials:
            List<Social>.from(json["socials"].map((x) => Social.fromJson(x))),
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
        "users": List<dynamic>.from(users.map((x) => x)),
        "companyDocuments": companyDocuments,
        "Buses": List<dynamic>.from(buses.map((x) => x)),
        "Drivers": List<dynamic>.from(drivers.map((x) => x)),
        "Trips": List<dynamic>.from(trips.map((x) => x)),
        "Bookings": List<dynamic>.from(bookings.map((x) => x)),
        "status": status,
        "__v": v,
        "socials": List<dynamic>.from(socials.map((x) => x.toJson())),
        "tagline": tagline,
        "logo": logo,
        "contactPersonEmail": contactPersonEmail,
        "contactPersonName": contactPersonName,
        "contactPersonPosition": contactPersonPosition,
        "contactPersonPhone": contactPersonPhone,
      };
}

class Social {
  String name;
  String link;
  String id;

  Social({
    required this.name,
    required this.link,
    required this.id,
  });

  factory Social.fromJson(Map<dynamic, dynamic> json) => Social(
        name: json["name"],
        link: json["link"],
        id: json["_id"],
      );

  Map<dynamic, dynamic> toJson() => {
        "name": name,
        "link": link,
        "_id": id,
      };
}

class Destination {
  String id;
  String country;
  String name;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Destination({
    required this.id,
    required this.country,
    required this.name,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Destination.fromJson(Map<dynamic, dynamic> json) => Destination(
        id: json["_id"],
        country: json["country"],
        name: json["name"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "country": country,
        "name": name,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class TimeScheduled {
  String startTime;
  String endTime;
  String id;

  TimeScheduled({
    required this.startTime,
    required this.endTime,
    required this.id,
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
