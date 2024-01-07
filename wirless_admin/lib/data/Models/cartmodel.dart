class cartmodel {
  num? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImg;
  int? itemsCount;
  int? itemsActive;
  String? itemsPrice;
  int? itemsPriceafter;
  String? itemsDate;
  num? itemsprice2;
  int? itemsCat;

  cartmodel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImg,
      this.itemsCount,
      this.itemsActive,
      this.itemsprice2,
      this.itemsPrice,
      this.itemsPriceafter,
      this.itemsDate,
      this.itemsCat});

  cartmodel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImg = json['items_img'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'].toString();
    itemsPriceafter = json['items_priceafter'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsprice2 = json['itemsprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
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
    return data;
  }
}