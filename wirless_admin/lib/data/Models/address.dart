class Addressmodel {
  String? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressHome;
  String? phoneaddress;

  Addressmodel(
      {this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressHome});

  Addressmodel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressHome = json['address_home'];
    phoneaddress = json['address_phone'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_home'] = this.addressHome;
    return data;
  }
}