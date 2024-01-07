class OrdersModel {
  int? oredersId;
  int? oredersUsersid;
  int? oredersAddress;
  int? oredersPricedilivry;
  int? oredersPrice;
  num? oredersTotalprice;
  int? oredersCoupon;
  String? oredersDiscraiting;
  String? oredersRating;
  int? oredersPaymentmethod;
  int? oredersStatus;
  String? oredersDatetime;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressHome;
  int? addressPhone;

  OrdersModel(
      {this.oredersId,
      this.oredersUsersid,
      this.oredersAddress,
      this.oredersPricedilivry,
      this.oredersPrice,
      this.oredersTotalprice,
      this.oredersCoupon,
      this.oredersDiscraiting,
      this.oredersRating,
      this.oredersPaymentmethod,
      this.oredersStatus,
      this.oredersDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressHome,
      this.addressPhone});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    oredersId = json['oreders_id'];
    oredersUsersid = json['oreders_usersid'];
    oredersAddress = json['oreders_address'];
    oredersPricedilivry = json['oreders_pricedilivry'];
    oredersPrice = json['oreders_price'];
    oredersTotalprice = json['oreders_totalprice'];
    oredersCoupon = json['oreders_coupon'];
    oredersDiscraiting = json['oreders_discraiting'];
    oredersRating = json['oreders_rating'].toString();
    oredersPaymentmethod = json['oreders_paymentmethod'];
    oredersStatus = json['oreders_status'];
    oredersDatetime = json['oreders_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressHome = json['address_home'];
    addressPhone = json['address_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oreders_id'] = this.oredersId;
    data['oreders_usersid'] = this.oredersUsersid;
    data['oreders_address'] = this.oredersAddress;
    data['oreders_pricedilivry'] = this.oredersPricedilivry;
    data['oreders_price'] = this.oredersPrice;
    data['oreders_totalprice'] = this.oredersTotalprice;
    data['oreders_coupon'] = this.oredersCoupon;
    data['oreders_discraiting'] = this.oredersDiscraiting;
    data['oreders_rating'] = this.oredersRating;
    data['oreders_paymentmethod'] = this.oredersPaymentmethod;
    data['oreders_status'] = this.oredersStatus;
    data['oreders_datetime'] = this.oredersDatetime;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_home'] = this.addressHome;
    data['address_phone'] = this.addressPhone;
    return data;
  }
}