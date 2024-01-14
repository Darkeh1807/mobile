Place placeFromJson(Map data) => Place.fromJson(data);

Map placeToJson(Place data) => data.toJson();

class Place {
    String? id;
    String? country;
    String? name;
    String? createdBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Place({
        this.id,
        this.country,
        this.name,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Place.fromJson(Map<dynamic, dynamic> json) => Place(
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
