class NotificationCategoryModel {
  String name;
  int count;

  NotificationCategoryModel({
    required this.name,
    required this.count,
  });

  factory NotificationCategoryModel.fromJson(Map<String, dynamic> json) =>
      NotificationCategoryModel(
        name: json["name"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
      };
}
