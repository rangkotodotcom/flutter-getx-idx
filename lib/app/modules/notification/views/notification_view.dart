import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/components/animations/loading_animation.dart';
import 'package:myapp/app/data/models/notificationmodel/notification_data_model.dart';
import 'package:myapp/app/modules/notification/views/notification_list.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        centerTitle: true,
      ),
      body: Stack(children: [
        RefreshIndicator(
          onRefresh: () async {
            // Trigger the refresh logic, usually involves refetching data
            await controller.refreshData();
          },
          child: FutureBuilder<List<NotificationDataModel>>(
            future: controller
                .fetchNotificationData(), // Your future method to fetch data
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available.'));
              } else {
                final notifications = snapshot.data!;
                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return NotificationListComponent(
                      notification: notification,
                      onTap: () => controller.isLoading.value
                          ? null
                          : () {
                              controller.isLoading.value = true;
                              controller.clickNotification(notification.id);
                            },
                    );
                  },
                );
              }
            },
          ),
        ),
        controller.isLoading.isTrue ? loading1() : Container(),
      ]),
    );
  }
}
