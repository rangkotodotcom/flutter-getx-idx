class NotificationDataModel {
  String id;
  String type;
  DataNotifModel data;
  String readAt;
  String readAtStr;
  String createdAt;
  String updatedAt;
  String createdAtStr;
  String updatedAtStr;

  NotificationDataModel({
    required this.id,
    required this.type,
    required this.data,
    required this.readAt,
    required this.readAtStr,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAtStr,
    required this.updatedAtStr,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      NotificationDataModel(
        id: json["id"],
        type: json["type"],
        data: DataNotifModel.fromJson(json["data"]),
        readAt: json["read_at"],
        readAtStr: json["read_at_str"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        createdAtStr: json["created_at_str"],
        updatedAtStr: json["updated_at_str"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "data": data.toJson(),
        "read_at": readAt,
        "read_at_str": readAtStr,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_at_str": createdAtStr,
        "updated_at_str": updatedAtStr,
      };
}

class DataNotifModel {
  NotifModel notif;
  String id;
  String type;
  String typeStr;

  DataNotifModel({
    required this.notif,
    required this.id,
    required this.type,
    required this.typeStr,
  });

  factory DataNotifModel.fromJson(Map<String, dynamic> json) => DataNotifModel(
        notif: NotifModel.fromJson(json["notif"]),
        id: json["id"],
        type: json["type"],
        typeStr: json["type_str"],
      );

  Map<String, dynamic> toJson() => {
        "notif": notif.toJson(),
        "type": type,
        "type_str": typeStr,
      };
}

class NotifModel {
  String title;
  String body;

  NotifModel({
    required this.title,
    required this.body,
  });

  factory NotifModel.fromJson(Map<String, dynamic> json) => NotifModel(
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
      };
}
