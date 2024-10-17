import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_borrow_controller.dart';

class LibraryBorrowView extends GetView<LibraryBorrowController> {
  const LibraryBorrowView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryBorrowView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryBorrowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
