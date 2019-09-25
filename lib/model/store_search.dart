class StoreSearch {
  List<Documents> documents;
  Meta meta;

  StoreSearch({this.documents, this.meta});

  StoreSearch.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = new List<Documents>();
      json['documents'].forEach((v) {
        documents.add(new Documents.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Documents {
  Address address;
  String addressName;
  String addressType;
  RoadAddress roadAddress;
  String x;
  String y;

  Documents(
      {this.address,
        this.addressName,
        this.addressType,
        this.roadAddress,
        this.x,
        this.y});

  Documents.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    addressName = json['address_name'];
    addressType = json['address_type'];
    roadAddress = json['road_address'] != null
        ? new RoadAddress.fromJson(json['road_address'])
        : null;
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['address_name'] = this.addressName;
    data['address_type'] = this.addressType;
    if (this.roadAddress != null) {
      data['road_address'] = this.roadAddress.toJson();
    }
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class Address {
  String addressName;
  String bCode;
  String hCode;
  String mainAdderssNo;
  String mainAddressNo;
  String mountainYn;
  String region1depthName;
  String region2depthName;
  String region3depthHName;
  String region3depthName;
  String subAdderssNo;
  String subAddressNo;
  String x;
  String y;
  String zipCode;

  Address(
      {this.addressName,
        this.bCode,
        this.hCode,
        this.mainAdderssNo,
        this.mainAddressNo,
        this.mountainYn,
        this.region1depthName,
        this.region2depthName,
        this.region3depthHName,
        this.region3depthName,
        this.subAdderssNo,
        this.subAddressNo,
        this.x,
        this.y,
        this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    bCode = json['b_code'];
    hCode = json['h_code'];
    mainAdderssNo = json['main_adderss_no'];
    mainAddressNo = json['main_address_no'];
    mountainYn = json['mountain_yn'];
    region1depthName = json['region_1depth_name'];
    region2depthName = json['region_2depth_name'];
    region3depthHName = json['region_3depth_h_name'];
    region3depthName = json['region_3depth_name'];
    subAdderssNo = json['sub_adderss_no'];
    subAddressNo = json['sub_address_no'];
    x = json['x'];
    y = json['y'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_name'] = this.addressName;
    data['b_code'] = this.bCode;
    data['h_code'] = this.hCode;
    data['main_adderss_no'] = this.mainAdderssNo;
    data['main_address_no'] = this.mainAddressNo;
    data['mountain_yn'] = this.mountainYn;
    data['region_1depth_name'] = this.region1depthName;
    data['region_2depth_name'] = this.region2depthName;
    data['region_3depth_h_name'] = this.region3depthHName;
    data['region_3depth_name'] = this.region3depthName;
    data['sub_adderss_no'] = this.subAdderssNo;
    data['sub_address_no'] = this.subAddressNo;
    data['x'] = this.x;
    data['y'] = this.y;
    data['zip_code'] = this.zipCode;
    return data;
  }
}

class RoadAddress {
  String addressName;
  String buildingName;
  String mainBuildingNo;
  String region1depthName;
  String region2depthName;
  String region3depthName;
  String roadName;
  String subBuildingNo;
  String undergrounYn;
  String undergroundYn;
  String x;
  String y;
  String zoneNo;

  RoadAddress(
      {this.addressName,
        this.buildingName,
        this.mainBuildingNo,
        this.region1depthName,
        this.region2depthName,
        this.region3depthName,
        this.roadName,
        this.subBuildingNo,
        this.undergrounYn,
        this.undergroundYn,
        this.x,
        this.y,
        this.zoneNo});

  RoadAddress.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    buildingName = json['building_name'];
    mainBuildingNo = json['main_building_no'];
    region1depthName = json['region_1depth_name'];
    region2depthName = json['region_2depth_name'];
    region3depthName = json['region_3depth_name'];
    roadName = json['road_name'];
    subBuildingNo = json['sub_building_no'];
    undergrounYn = json['undergroun_yn'];
    undergroundYn = json['underground_yn'];
    x = json['x'];
    y = json['y'];
    zoneNo = json['zone_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_name'] = this.addressName;
    data['building_name'] = this.buildingName;
    data['main_building_no'] = this.mainBuildingNo;
    data['region_1depth_name'] = this.region1depthName;
    data['region_2depth_name'] = this.region2depthName;
    data['region_3depth_name'] = this.region3depthName;
    data['road_name'] = this.roadName;
    data['sub_building_no'] = this.subBuildingNo;
    data['undergroun_yn'] = this.undergrounYn;
    data['underground_yn'] = this.undergroundYn;
    data['x'] = this.x;
    data['y'] = this.y;
    data['zone_no'] = this.zoneNo;
    return data;
  }
}

class Meta {
  bool isEnd;
  int pageableCount;
  int totalCount;

  Meta({this.isEnd, this.pageableCount, this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    isEnd = json['is_end'];
    pageableCount = json['pageable_count'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_end'] = this.isEnd;
    data['pageable_count'] = this.pageableCount;
    data['total_count'] = this.totalCount;
    return data;
  }
}
