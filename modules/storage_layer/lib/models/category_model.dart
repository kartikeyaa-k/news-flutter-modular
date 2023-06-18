class ProductCategory {
  String id;
  String name;

  ProductCategory({
    required this.id,
    required this.name,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['categoryId'],
      name: json['categoryName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = id;
    data['categoryName'] = name;
    return data;
  }

  static List<ProductCategory> listFromJson(List<dynamic> json) => json.isEmpty
      ? <ProductCategory>[]
      : json.map((dynamic value) => ProductCategory.fromJson(value)).toList();

  static List<Map<String, dynamic>> jsonFromList(
      List<ProductCategory> categoryList) {
    return categoryList
        .map((ProductCategory category) => category.toJson())
        .toList();
    // return jsonEncode(list);
  }
}
