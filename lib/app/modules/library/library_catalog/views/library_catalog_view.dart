import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_catalog_controller.dart';

class LibraryCatalogView extends GetView<LibraryCatalogController> {
  const LibraryCatalogView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryCatalogView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryCatalogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
