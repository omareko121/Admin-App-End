class NotivationModel {
  int? notificationId;
  String? notificationTitle;
  String? notificationBody;
  int? notificationUserid;

  NotivationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationUserid});

  NotivationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationUserid = json['notification_userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationBody;
    data['notification_userid'] = this.notificationUserid;
    return data;
  }
}