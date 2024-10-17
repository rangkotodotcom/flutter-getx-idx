import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/library/library_booking/views/library_booking_create_view.dart';

import '../controllers/library_booking_controller.dart';

class LibraryBookingView extends GetView<LibraryBookingController> {
  const LibraryBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              top: 20,
            ),
            child: InkWell(
              onTap: () => Get.to(() => const LibraryBookingCreateView()),
              child: const Badge(
                label: Text("10"),
                child: Icon(
                  Icons.shopping_cart_checkout_rounded,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'LibraryBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
