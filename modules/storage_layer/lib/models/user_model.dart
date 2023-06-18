import 'dart:convert';

class User {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? token;
  bool? isAuthenticated;
  String? profilePhoto;
  String? role;
  bool? firstLogin;
  String? partnerId;
  String? customerSubCommunityID;
  String? customerSubCommunityName;
  String? customerCommunityID;
  String? customerCommunityName;
  String? adress;
  String? villaNumber;
  String? longitude;
  String? latitude;
  dynamic truck;
  DriverBroadcastData? driverBroadcastData;
  String? onlineLocationText;

  User({
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.token,
    this.isAuthenticated,
    this.profilePhoto,
    this.role,
    this.firstLogin,
    this.partnerId,
    this.customerSubCommunityID,
    this.customerSubCommunityName,
    this.customerCommunityID,
    this.customerCommunityName,
    this.adress,
    this.longitude,
    this.latitude,
    this.villaNumber,
    this.truck,
    this.driverBroadcastData,
    this.onlineLocationText,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final driverBroadcastDataJson = json['driverBroadcastData'] != null
        ? jsonDecode(json['driverBroadcastData'])
        : null;
    final driverBroadcastData = driverBroadcastDataJson != null
        ? DriverBroadcastData.fromJson((driverBroadcastDataJson))
        : null;
    return User(
      id: json['id'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      token: json['bearerToken'],
      isAuthenticated: json['isAuthenticated'],
      profilePhoto: json['profilePhoto'],
      role: json['roles'],
      firstLogin: json['firstLogin'],
      partnerId: json['partnerId'],
      customerSubCommunityID: json['customerSubCommunityID'],
      customerSubCommunityName: json['customerSubCommunityName'],
      customerCommunityID: json['customerCommunityID'],
      customerCommunityName: json['customerCommunityName'],
      adress: json['address'],
      longitude: json['longitude'],
      villaNumber: json['vilaNumber'],
      latitude: json['latitude'],
      truck: json['truck'],
      driverBroadcastData: driverBroadcastData,
      onlineLocationText: json['onlineLocationText'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['bearerToken'] = token;
    data['isAuthenticated'] = isAuthenticated;
    data['profilePhoto'] = profilePhoto;
    data['roles'] = role;
    data['firstLogin'] = firstLogin;
    data['partnerId'] = partnerId;
    data['customerSubCommunityID'] = customerSubCommunityID;
    data['customerSubCommunityName'] = customerSubCommunityName;
    data['customerCommunityID'] = customerCommunityID;
    data['customerCommunityName'] = customerCommunityName;
    data['address'] = adress;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['vilaNumber'] = villaNumber;
    data['truck'] = truck;
    if (driverBroadcastData != null) {
      data['driverBroadcastData'] = driverBroadcastData?.toJson();
    }
    data['onlineLocationText'] = onlineLocationText;
    return data;
  }
}

class DriverBroadcastData {
  final String? truckId;
  final List<String>? subcommunityIds;
  final String? communityId;
  final bool? isActive;
  final String? userEmail;
  final int? broadcastType;
  String? onlineLocationText;

  DriverBroadcastData({
    this.truckId,
    this.subcommunityIds,
    this.communityId,
    this.isActive,
    this.userEmail,
    this.broadcastType,
    this.onlineLocationText,
  });

  factory DriverBroadcastData.fromJson(Map<String, dynamic> json) {
    return DriverBroadcastData(
      truckId: json['truckId'] ?? json['TruckId'],
      subcommunityIds: json['subcommunityIds'] != null
          ? List<String>.from(json['subcommunityIds'])
          : null,
      communityId: json['CommunityId'] ?? json['communityId'],
      isActive: json['IsActive'] ?? json['isActive'],
      userEmail: json['UserEmail'] ?? json['userEmail'],
      broadcastType: json['BroadcastType'] ?? json['broadcastType'],
      onlineLocationText: json['onlineLocationText'],
    );
  }

  String toJson() {
    final res = {
      'truckId': truckId,
      'subcommunityIds': subcommunityIds,
      'communityId': communityId,
      'isActive': isActive,
      'userEmail': userEmail,
      'broadcastType': broadcastType,
      'onlineLocationText': onlineLocationText,
    };

    return jsonEncode(res);
  }
}
