import 'package:get/get.dart';
import 'package:myapp/app/data/models/notificationmodel/notification_data_model.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  List<NotificationDataModel> notifications = [];

  Future<void> refreshData() async {
    // Fetch the latest data
    await fetchNotificationData();
    update(); // Notify listeners about the changes
  }

  Future<List<NotificationDataModel>> fetchNotificationData() async {
    // Simulate network call
    await Future.delayed(const Duration(seconds: 5));

    notifications = List<NotificationDataModel>.generate(
      10,
      (index) => NotificationDataModel(
        id: index.toString(),
        type: "type $index",
        readAt: (index % 2 == 0) ? "" : "2024-10-20",
        readAtStr: (index % 2 == 0) ? "" : "2024-10-20",
        createdAt: "",
        createdAtStr: "${index * 10} menit lalu",
        updatedAt: "",
        updatedAtStr: "",
        data: DataNotifModel(
          notif: NotifModel(
            title: "Judul Notif $index",
            body: "Body Notif $index",
          ),
          id: "id notif $index",
          type: "0000",
          typeStr: "type $index",
        ),
      ),
    );

    return notifications;
  }

  Future<void> clickNotification(String id) async {
    print("click Notif");
    try {
      // Simulate form submission
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
    } finally {
      isLoading.value = false; // Ensure loading is stopped
    }
  }
}
