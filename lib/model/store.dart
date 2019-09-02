class Store {
  int storeUserId, star,lat,lng;
  String name, time, menu;


  Store.fromJson(Map map) {
  this.storeUserId = map['storeuser_id'];
  this.star = map['star'];
  this.lat = map['lat'];
  this.lng = map['lng'];

  this.name = map['name'];
  this.time = map['time'];
  this.time = map['menu'];
  }
}