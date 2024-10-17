import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_member_controller.dart';

class LibraryMemberView extends GetView<LibraryMemberController> {
  const LibraryMemberView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anggota Pustaka'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: const Text(
              "Status Keanggotaan Pustaka",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
