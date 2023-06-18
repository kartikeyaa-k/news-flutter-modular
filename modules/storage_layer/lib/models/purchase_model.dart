class SalesOrderFilter {
  DateFilter? dateFilter;
  LocationFilter? locationFilter;
  PartnerFilter? partnerFilter;
  List<int>? status;

  SalesOrderFilter({
    this.dateFilter,
    this.locationFilter,
    this.partnerFilter,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dateFilter != null) {
      data['dateFilter'] = dateFilter?.toJson();
    }
    if (locationFilter != null) {
      data['locationFilter'] = locationFilter?.toJson();
    }
    if (partnerFilter != null) {
      data['partnerFilter'] = partnerFilter?.toJson();
    }
    if (status != null) {
      data['status'] = status;
    }
    return data;
  }
}

class DateFilter {
  DateTime? from;
  DateTime? to;

  DateFilter({this.from, this.to});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from?.toIso8601String();
    data['to'] = to?.toIso8601String();
    return data;
  }
}

class LocationFilter {
  List<String>? subCommunityIds;

  LocationFilter({this.subCommunityIds});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subCommunityIds != null) {
      data['subCommunityIds'] = subCommunityIds;
    }
    return data;
  }
}

class PartnerFilter {
  List<String>? truckIds;

  PartnerFilter({this.truckIds});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (truckIds != null) {
      data['truckIds'] = truckIds;
    }
    return data;
  }
}

class PurchasesBodyModel {
  int? skip;
  int? pageSize;
  String? searchQuery;
  String? fields;
  String? orderBy;
  String? searchText;
  SalesOrderFilter? salesOrderFilter;

  PurchasesBodyModel({
    this.skip,
    this.pageSize,
    this.searchQuery,
    this.fields,
    this.orderBy,
    this.searchText,
    this.salesOrderFilter,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skip'] = skip;
    data['pageSize'] = pageSize;
    data['searchQuery'] = searchQuery;
    data['fields'] = fields;
    data['orderBy'] = orderBy;
    data['searchText'] = searchText;
    if (salesOrderFilter != null) {
      data['salesOrderFilter'] = salesOrderFilter?.toJson();
    }
    return data;
  }
}
