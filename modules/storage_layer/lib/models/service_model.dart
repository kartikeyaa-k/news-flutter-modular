class Service {
  String inventoryId;
  num quantity;
  num price;
  num minSellQty;
  String productName;
  bool isVisible;
  num orderNumber;
  String description;
  String categoryName;
  String categoryId;
  bool favourite = false;
  String unitCode;
  String? productImg;
  num? selectedQty;

  Service(
      {required this.inventoryId,
      required this.quantity,
      required this.price,
      required this.minSellQty,
      required this.productName,
      required this.isVisible,
      required this.orderNumber,
      this.description = "",
      required this.categoryName,
      required this.categoryId,
      this.favourite = false,
      required this.unitCode,
      this.productImg,
      this.selectedQty});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
        inventoryId: json['inventoryId'],
        quantity: json['quantity'],
        price: json['price'],
        minSellQty: json['minimalSellingQuantity'],
        productName: json['productName'],
        isVisible: json['isVisible'],
        orderNumber: json['orderNumber'],
        description: json['description'] ?? "",
        categoryName: json['categoryName'],
        categoryId: json['categoryId'],
        favourite: json['favourite'] ?? false,
        unitCode: json['unitCode'],
        productImg: json['productImg'],
        selectedQty: json['selectedQty']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['inventoryId'] = inventoryId;
    data['quantity'] = quantity;
    data['price'] = price;
    data['minimalSellingQuantity'] = minSellQty;
    data['productName'] = productName;
    data['isVisible'] = isVisible;
    data['orderNumber'] = orderNumber;
    data['description'] = description;
    data['categoryName'] = categoryName;
    data['categoryId'] = categoryId;
    data['favourite'] = favourite;
    data['unitCode'] = unitCode;
    data['productImg'] = productImg;
    data['selectedQty'] = selectedQty;
    return data;
  }

  static List<Service> listFromJson(List<dynamic> json) => json.isEmpty
      ? <Service>[]
      : json.map((dynamic value) => Service.fromJson(value)).toList();

  static List<Map<String, dynamic>> jsonFromList(List<Service> serviceList) {
    return serviceList.map((Service service) => service.toJson()).toList();
    // return jsonEncode(list);
  }
}
