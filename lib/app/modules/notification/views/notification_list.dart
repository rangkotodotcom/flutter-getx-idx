import 'package:flutter/material.dart';
import 'package:myapp/app/constants/color.dart';
import 'package:myapp/app/data/models/notificationmodel/notification_data_model.dart';


class NotificationListComponent extends StatelessWidget {
  const NotificationListComponent({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final NotificationDataModel notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color:
            notification.readAt.isEmpty ? Colors.indigoAccent[400] : Colors.white,
        border: const Border(
          top: BorderSide(
            width: 1,
            color: colorBackGround,
          ),
          bottom: BorderSide(
            width: 1,
            color: colorBackGround,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor:
              notification.readAt.isEmpty ? colorBackGround : Colors.grey,
          child: Icon(
            Icons.notifications,
            color: notification.readAt.isEmpty ? Colors.indigoAccent : Colors.white,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notification.data.typeStr,
              style: TextStyle(
                fontSize: 11,
                color:notification.readAt.isEmpty?Colors.white: Colors.black54,
                fontWeight: notification.readAt.isEmpty
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            Text(
              notification.createdAtStr,
              style: TextStyle(
                fontSize: 11,
                color: notification.readAt.isEmpty?Colors.white:Colors.black54,
                fontWeight: notification.readAt.isEmpty
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              notification.data.notif.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: notification.readAt.isEmpty?Colors.white:Colors.black,
                fontWeight: notification.readAt.isEmpty
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            Text(
              notification.data.notif.body,
              style: TextStyle(
                fontSize: 12,
                color: notification.readAt.isEmpty?Colors.white:colorBackGround,
                fontWeight: notification.readAt.isEmpty
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
