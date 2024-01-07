
class Itemsmodel {
  String? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImg;
  int? itemsCount;
  int? itemsActive;
  String? itemsPrice;
  String? itemsPriceafter;
  String? itemsDate;
  int? itemsCat;
  int? categoriesId;
  num? itemsafterdiscont;
  String? categoriesName;
  String? categoriesImg;
  String? categoriesDate;
  String? favoritedata;

  Itemsmodel(
      {this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImg,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsPriceafter,
      this.itemsDate,
      this.itemsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesImg,
      this.categoriesDate,
      this.favoritedata,
      this.itemsafterdiscont,
      
      });

  Itemsmodel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImg = json['items_img'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'].toString();
    itemsPriceafter = json['items_priceafter'].toString();
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImg = json['categories_img'];
    categoriesDate = json['categories_date'];
    favoritedata = json['favorite'];
    itemsafterdiscont = json['itemsafterdiscont'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_img'] = this.categoriesImg;
    data['categories_date'] = this.categoriesDate;
    data['favorite'] = this.favoritedata;
    data['itemsafterdiscont'] = this.itemsafterdiscont;
    return data;
  }
}