import 'package:myapp/app/data/models/notificationmodel/notification_category_model.dart';
import 'package:myapp/app/data/models/notificationmodel/notification_data_model.dart';

class NotificationModel {
  NotificationCategoryModel category;
  NotificationDataModel data;

  NotificationModel({
    required this.category,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        category: NotificationCategoryModel.fromJson(json["category"]),
        data: NotificationDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "data": data.toJson(),
      };
}
