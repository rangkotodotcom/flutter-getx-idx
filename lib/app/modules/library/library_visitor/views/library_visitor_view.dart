import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_visitor_controller.dart';

class LibraryVisitorView extends GetView<LibraryVisitorController> {
  const LibraryVisitorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryVisitorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryVisitorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
