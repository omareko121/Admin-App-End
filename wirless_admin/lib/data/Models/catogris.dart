class Catigoris {
  String? categoriesId;
  String? categoriesName;
  String? categoriesImg;
  String? categoriesDate;

  Catigoris(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesImg,
      this.categoriesDate});

  Catigoris.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'];
    categoriesImg = json['categories_img'];
    categoriesDate = json['categories_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_img'] = this.categoriesImg;
    data['categories_date'] = this.categoriesDate;
    return data;
  }
}