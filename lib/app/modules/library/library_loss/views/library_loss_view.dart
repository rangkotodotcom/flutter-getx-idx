import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_loss_controller.dart';

class LibraryLossView extends GetView<LibraryLossController> {
  const LibraryLossView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryLossView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryLossView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
