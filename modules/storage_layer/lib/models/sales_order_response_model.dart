class SalesOrder {
  String? id;
  String? orderNumber;
  String? note;
  String? termAndCondition;
  String? createdDate;
  int? status;
  String? deliveryDate;
  int? deliveryStatus;
  String? customerId;
  String? customerName;
  String? customerAddress;
  String? customerPhone;
  String? partnerCode;
  String? truckCode;
  String? truckId;
  int? truckType;
  String? truckName;
  double? totalAmount;
  double totalTax;
  int? paymentStatus;
  String? childId;
  String? referenceId;
  List<SalesOrderItem>? salesOrderItems;

  SalesOrder(
      {this.id,
      this.orderNumber,
      this.note,
      this.termAndCondition,
      this.createdDate,
      this.status,
      this.deliveryDate,
      this.deliveryStatus,
      this.customerId,
      this.customerName,
      this.customerAddress,
      this.customerPhone,
      this.partnerCode,
      this.truckCode,
      this.truckId,
      this.totalAmount,
      this.truckType,
      this.truckName,
      required this.totalTax,
      this.paymentStatus,
      this.childId,
      this.referenceId,
      this.salesOrderItems});

  factory SalesOrder.fromJson(Map<String, dynamic> json) {
    List<SalesOrderItem>? salesOrderItems;
    var list = json['salesOrderItems'];
    if (list != null) {
      salesOrderItems = SalesOrderItem.listFromJson(list);
    } else {
      salesOrderItems = null;
    }

    return SalesOrder(
      id: json['id'],
      orderNumber: json['orderNumber'],
      note: json['note'],
      termAndCondition: json['termAndCondition'],
      // createdDate: DateTime.parse(json['createdDate']),
      createdDate: json['createdDate'],
      status: json['status'],
      // deliveryDate: DateTime.parse(json['deliveryDate']),
      deliveryDate: json['deliveryDate'],
      deliveryStatus: json['deliveryStatus'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      customerAddress: json['customerAddress'],
      customerPhone: json['customerPhone'],
      partnerCode: json['partnerCode'],
      truckCode: json['truckCode'],
      truckId: json['truckId'],
      truckName: json["truckName"],
      totalAmount: json['totalAmount'],
      totalTax: json['totalTax'],
      paymentStatus: json['paymentStatus'],
      childId: json["childID"],
      referenceId: json["referenceID"],
      salesOrderItems: salesOrderItems,
      truckType: json['truckType'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderNumber": orderNumber,
        "note": note,
        "termAndCondition": termAndCondition,
        // createdDate: DateTime.parse('createdDate']),
        "createdDate": createdDate,
        'status': status,
        // deliveryDate: DateTime.parse('deliveryDate']),
        "deliveryDate": deliveryDate,
        "deliveryStatus": deliveryStatus,
        "customerId": customerId,
        "customerName": customerName,
        "customerAddress": customerAddress,
        "customerPhone": customerPhone,
        "partnerCode": partnerCode,
        "truckCode": truckCode,
        "truckId": truckId,
        "truckName": truckName,
        "totalAmount": totalAmount,
        "totalTax": totalTax,
        "paymentStatus": paymentStatus,
        "childID": childId,
        "referenceID": referenceId,
        "salesOrderItems": salesOrderItems != null
            ? SalesOrderItem.listToJson(salesOrderItems!)
            : [],
        "truckType": truckType,
      };

  static List<SalesOrder> listFromJson(List<dynamic> json) => json.isEmpty
      ? <SalesOrder>[]
      : json.map((dynamic value) => SalesOrder.fromJson(value)).toList();
}

class SalesOrderItem {
  String? id;
  String? inventoryId;
  String? productId;
  ProductSalesOrder? product;
  String? customerId;
  String? salesOrderId;
  double unitPrice;
  num? quantity;
  double taxValue;
  double totalTax;
  double totalValue;
  String? productName;
  String? unitName;
  String? unitId;
  String? salesOrderNumber;
  double total;
  String? customerName;
  String? warehouseId;
  String? warehouseName;
  UnitConversation? unitConversation;

  SalesOrderItem(
      {this.id,
      this.inventoryId,
      this.productId,
      this.product,
      this.customerId,
      this.salesOrderId,
      required this.unitPrice,
      this.quantity,
      required this.taxValue,
      required this.totalTax,
      required this.totalValue,
      this.productName,
      this.unitName,
      this.unitId,
      this.salesOrderNumber,
      required this.total,
      this.customerName,
      this.warehouseId,
      this.warehouseName,
      this.unitConversation});

  factory SalesOrderItem.fromJson(Map<String, dynamic> json) {
    return SalesOrderItem(
        id: json['id'],
        inventoryId: json['inventoryID'],
        productId: json['productId'],
        product: ProductSalesOrder.fromJson(json['product']),
        customerId: json['customerId'] ?? json['customerID'],
        salesOrderId: json['salesOrderId'],
        unitPrice: json['unitPrice'],
        quantity: json['quantity'],
        taxValue: json['taxValue'],
        totalTax: json['totalTax'],
        totalValue: json['totalValue'],
        productName: json['productName'],
        unitName: json['unitName'],
        unitId: json['unitId'],
        salesOrderNumber: json['salesOrderNumber'],
        total: json['total'],
        customerName: json['customerName'],
        warehouseId: json['warehouseId'],
        warehouseName: json['warehouseName'],
        unitConversation: json['unitConversation'] != null
            ? UnitConversation.fromJson(json['unitConversation'])
            : null);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'inventoryID': inventoryId,
        'productId': productId,
        'product': product?.toJson(),
        'customerId': customerId,
        'salesOrderId': salesOrderId,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'taxValue': taxValue,
        'totalTax': totalTax,
        'totalValue': totalValue,
        'productName': productName,
        'unitName': unitName,
        'unitId': unitId,
        'salesOrderNumber': salesOrderNumber,
        'total': total,
        'customerName': customerName,
        'warehouseId': warehouseId,
        'warehouseName': warehouseName,
        'unitConversation': unitConversation?.toJson()
      };

  static List<SalesOrderItem> listFromJson(List<dynamic> json) => json.isEmpty
      ? <SalesOrderItem>[]
      : json.map((dynamic value) => SalesOrderItem.fromJson(value)).toList();

  static List<dynamic> listToJson(List<SalesOrderItem> salesOrderItems) =>
      salesOrderItems.isEmpty
          ? <dynamic>[]
          : salesOrderItems
              .map((SalesOrderItem value) => value.toJson())
              .toList();
}

class ProductSalesOrder {
  String? id;
  String? name;
  String? description;
  String? category;
  int? price;
  String? unitId;
  String? unitName;
  bool? isActive;
  String? productImg;

  ProductSalesOrder(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.price,
      this.unitId,
      this.unitName,
      this.isActive,
      this.productImg});

  factory ProductSalesOrder.fromJson(Map<String, dynamic> json) {
    return ProductSalesOrder(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        category: json['category'] ?? json['categoryId'],
        price: json['price'] ?? json["salesPrice"],
        unitId: json['unitId'],
        unitName: json['unitName'],
        isActive: json['isActive'] ?? false,
        productImg: json['qrCodeUrl']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category': category,
        'price': price,
        'unitId': unitId,
        'unitName': unitName,
        'isActive': isActive,
        'qrCodeUrl': productImg,
      };
}

class UnitConversation {
  String? id;
  String? name;
  String? code;
  double? value;

  UnitConversation({this.id, this.name, this.code, this.value});

  factory UnitConversation.fromJson(Map<String, dynamic> json) {
    return UnitConversation(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value,
        'code': code,
      };
}
