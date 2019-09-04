class Store {
  int storeUserId;
  double lat,lng;
  String name;
  bool like;



  Store({this.storeUserId, this.like, this.lat, this.lng, this.name, });

  Store.fromJson(Map map) {
    this.storeUserId = map['storeuser_id'];
    this.like = map['like'];
    this.lat = map['lat'];
    this.lng = map['lng'];

    this.name = map['name'];

  }
}