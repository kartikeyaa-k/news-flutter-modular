class Product {
  String inventoryId;
  String productId;
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

  Product(
      {required this.inventoryId,
      required this.productId,
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        inventoryId: json['inventoryId'],
        productId: json['productId'],
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
    data['productId'] = productId;
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

  static List<Product> listFromJson(List<dynamic> json) => json.isEmpty
      ? <Product>[]
      : json.map((dynamic value) => Product.fromJson(value)).toList();

  static List<Map<String, dynamic>> jsonFromList(List<Product> productList) {
    return productList.map((Product product) => product.toJson()).toList();
    // return jsonEncode(list);
  }
}
