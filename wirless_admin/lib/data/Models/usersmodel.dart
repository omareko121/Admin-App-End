class Usersmodel {
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  int? usersVerifaidcode;
  int? usersApprove;
  String? usersCreate;

  Usersmodel(
      {this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifaidcode,
      this.usersApprove,
      this.usersCreate});

  Usersmodel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'].toString();
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifaidcode = json['users_verifaidcode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_password'] = this.usersPassword;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verifaidcode'] = this.usersVerifaidcode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    return data;
  }
}