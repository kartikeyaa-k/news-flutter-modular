class Truck {
  String name;
  String truckNumber;
  bool? status;
  String? lastActive;
  String? partnerId;
  String id;
  String? subcommunityId;
  String? partnerImg;
  int? truckType;
  String? description;

  Truck(
      {required this.name,
      required this.truckNumber,
      this.status,
      this.lastActive,
      this.partnerId,
      required this.id,
      this.subcommunityId,
      this.partnerImg,
      this.truckType,
      this.description});

  factory Truck.fromJson(Map<String, dynamic> json) {
    return Truck(
      name: json['name'] ?? json['truckName'],
      truckNumber: json['truckNumber'] ?? json['truckCode'] ?? json['code'],
      status: json['status'],
      lastActive: json['lastActive'],
      partnerId: json['partnerId'],
      id: json['id'],
      subcommunityId: json['subcommunityId'],
      partnerImg: json['partnerImg'],
      truckType: json['truckType'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['truckNumber'] = truckNumber;
    data['status'] = status;
    data['lastActive'] = lastActive;
    data['partnerId'] = partnerId;
    data['id'] = id;
    data['subcommunityId'] = subcommunityId;
    data['partnerImg'] = partnerImg;
    data['truckType'] = truckType;
    data['description'] = description;
    return data;
  }

  static List<Truck> listFromJson(List<dynamic> json) => json.isEmpty
      ? <Truck>[]
      : json.map((dynamic value) => Truck.fromJson(value)).toList();

  static List<Map<String, dynamic>> jsonFromList(List<Truck> truckList) {
    return truckList.map((Truck truck) => truck.toJson()).toList();
    // return jsonEncode(list);
  }
}
