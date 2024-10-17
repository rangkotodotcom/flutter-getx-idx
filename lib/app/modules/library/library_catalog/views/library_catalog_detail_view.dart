import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LibraryCatalogDetailView extends GetView {
  const LibraryCatalogDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryCatalogDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryCatalogDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
