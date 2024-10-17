import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_booking_controller.dart';

class LibraryBookingView extends GetView<LibraryBookingController> {
  const LibraryBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryBookingView'),
        centerTitle: true,
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
