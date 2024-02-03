// class Ticket {
//     String? id;
//     Booking? booking;
//     String? qrCode;
//     String? user;
//     String? status;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;

//     Ticket({
//          this.id,
//          this.booking,
//          this.qrCode,
//          this.user,
//          this.status,
//          this.createdAt,
//          this.updatedAt,
//          this.v,
//     });

//     factory Ticket.fromJson(Map<dynamic, dynamic> json) => Ticket(
//         id: json["_id"],
//         booking: Booking.fromJson(json["Booking"]),
//         qrCode: json["QRCode"],
//         user: json["user"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<dynamic, dynamic> toJson() => {
//         "_id": id,
//         "Booking": booking?.toJson(),
//         "QRCode": qrCode,
//         "user": user,
//         "status": status,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//     };
// }

// class Booking {
//     String? id;
//     Trip? trip;
//     String? user;
//     String? status;
//     int? amount;
//     String? paymentStatus;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;
//     String? paymentChannel;
//     DateTime? paymentDate;
//     String? paymentMethod;
//     String? paymentReference;
//     int? seatNumber;

//     Booking({
//          this.id,
//          this.trip,
//          this.user,
//          this.status,
//          this.amount,
//          this.paymentStatus,
//          this.createdAt,
//          this.updatedAt,
//          this.v,
//          this.paymentChannel,
//          this.paymentDate,
//          this.paymentMethod,
//          this.paymentReference,
//          this.seatNumber,
//     });

//     factory Booking.fromJson(Map<dynamic, dynamic> json) => Booking(
//         id: json["_id"],
//         trip: Trip.fromJson(json["Trip"]),
//         user: json["User"],
//         status: json["status"],
//         amount: json["amount"],
//         paymentStatus: json["paymentStatus"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         paymentChannel: json["paymentChannel"],
//         paymentDate: DateTime.parse(json["paymentDate"]),
//         paymentMethod: json["paymentMethod"],
//         paymentReference: json["paymentReference"],
//         seatNumber: json["seatNumber"],
//     );

//     Map<dynamic, dynamic> toJson() => {
//         "_id": id,
//         "Trip": trip?.toJson(),
//         "User": user,
//         "status": status,
//         "amount": amount,
//         "paymentStatus": paymentStatus,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "paymentChannel": paymentChannel,
//         "paymentDate": paymentDate?.toIso8601String(),
//         "paymentMethod": paymentMethod,
//         "paymentReference": paymentReference,
//         "seatNumber": seatNumber,
//     };
// }

// class Trip {
//     List<dynamic>? slots;
//     String? id;
//     DateTime? date;
//     String? origin;
//     String? destination;
//     String? numberOfBusAssigned;
//     String? tripStatus;
//     String? tripType;
//     String? busCompany;
//     String? bus;
//     int? price;
//     String? createdBy;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;
//     TimeScheduled? timeScheduled;

//     Trip({
//          this.slots,
//          this.id,
//          this.date,
//          this.origin,
//          this.destination,
//          this.numberOfBusAssigned,
//          this.tripStatus,
//          this.tripType,
//          this.busCompany,
//          this.bus,
//          this.price,
//          this.createdBy,
//          this.createdAt,
//          this.updatedAt,
//          this.v,
//          this.timeScheduled,
//     });

//     factory Trip.fromJson(Map<dynamic, dynamic> json) => Trip(
//         slots: List<dynamic>.from(json["slots"].map((x) => x)),
//         id: json["_id"],
//         date: DateTime.parse(json["date"]),
//         origin: json["origin"],
//         destination: json["destination"],
//         numberOfBusAssigned: json["numberOfBusAssigned"],
//         tripStatus: json["tripStatus"],
//         tripType: json["tripType"],
//         busCompany: json["busCompany"],
//         bus: json["bus"],
//         price: json["price"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         timeScheduled: TimeScheduled.fromJson(json["timeScheduled"]),
//     );

//     Map<dynamic, dynamic> toJson() => {
//         "slots": List<dynamic>.from(slots!.map((x) => x)),
//         "_id": id,
//         "date": date?.toIso8601String(),
//         "origin": origin,
//         "destination": destination,
//         "numberOfBusAssigned": numberOfBusAssigned,
//         "tripStatus": tripStatus,
//         "tripType": tripType,
//         "busCompany": busCompany,
//         "bus": bus,
//         "price": price,
//         "createdBy": createdBy,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "timeScheduled": timeScheduled?.toJson(),
//     };
// }

// class TimeScheduled {
//     String? startTime;
//     String? endTime;
//     String? id;

//     TimeScheduled({
//          this.startTime,
//          this.endTime,
//          this.id,
//     });

//     factory TimeScheduled.fromJson(Map<dynamic, dynamic> json) => TimeScheduled(
//         startTime: json["startTime"],
//         endTime: json["endTime"],
//         id: json["_id"],
//     );

//     Map<dynamic, dynamic> toJson() => {
//         "startTime": startTime,
//         "endTime": endTime,
//         "_id": id,
//     };
// }
