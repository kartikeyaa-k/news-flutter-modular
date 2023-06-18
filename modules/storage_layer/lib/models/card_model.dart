class StripeCard {
  String id;
  String brand;
  String country;
  num expMonth;
  num expYear;
  String last4;
  String? funding;
  String? fingerprint;
  String? iin;
  String? issuer;
  String? description;

  StripeCard({
    required this.id,
    required this.brand,
    required this.country,
    required this.expMonth,
    required this.expYear,
    required this.last4,
    this.funding,
    this.fingerprint,
    this.iin,
    this.issuer,
    this.description,
  });

  factory StripeCard.fromJson(Map<String, dynamic> json) {
    return StripeCard(
      id: json['id'],
      brand: json['brand'],
      country: json['country'],
      expMonth: json['exp_month'],
      expYear: json['exp_year'],
      last4: json['last4'],
      funding: json['funding'],
      fingerprint: json['fingerprint'],
      iin: json['iin'],
      issuer: json['issuer'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
    data['country'] = country;
    data['exp_month'] = expMonth;
    data['exp_year'] = expYear;
    data['last4'] = last4;
    data['funding'] = funding;
    data['fingerprint'] = fingerprint;
    data['iin'] = iin;
    data['issuer'] = issuer;
    data['description'] = description;
    return data;
  }

  static List<StripeCard> listFromJson(List<dynamic> json) => json.isEmpty
      ? <StripeCard>[]
      : json.map((dynamic value) => StripeCard.fromJson(value)).toList();

  static List<Map<String, dynamic>> jsonFromList(List<StripeCard> cardList) {
    return cardList.map((StripeCard card) => card.toJson()).toList();
    // return jsonEncode(list);
  }
}
