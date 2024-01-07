class myfavorite {
  String? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImg;
  int? itemsCount;
  int? itemsActive;
  num? itemsPrice;
  int? itemsPriceafter;
  String? itemsDate;
  int? itemsCat;
  int? usersId;

  myfavorite(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImg,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsPriceafter,
      this.itemsDate,
      this.itemsCat,
      this.usersId});

  myfavorite.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'].toString();
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImg = json['items_img'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsPriceafter = json['items_priceafter'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_img'] = this.itemsImg;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_priceafter'] = this.itemsPriceafter;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['users_id'] = this.usersId;
    return data;
  }
}