class StoreUser{
  String email, phone, pw, target, image;
  int age, storeId, adId;
  bool gender;

  StoreUser.fromJson(Map map) {
    this.email = map['email'];
    this.phone = map['phone'];
    this.pw = map['pw'];
    this.target = map['target'];
    this.image = map['image'];

    this.age = map['age'];
    this.storeId = map['store_id'];
    this.adId = map['ad_id'];

    this.gender = map['gender'];
  }
}