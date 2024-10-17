import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_return_controller.dart';

class LibraryReturnView extends GetView<LibraryReturnController> {
  const LibraryReturnView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryReturnView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryReturnView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
