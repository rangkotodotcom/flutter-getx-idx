import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LibraryBookingCreateView extends GetView {
  const LibraryBookingCreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Buku'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'LibraryBookingCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
