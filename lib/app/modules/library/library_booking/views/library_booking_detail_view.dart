import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LibraryBookingDetailView extends GetView {
  const LibraryBookingDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryBookingDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryBookingDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
