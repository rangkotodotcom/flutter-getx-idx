import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/library/views/menu.dart';

import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perpustakaan'),
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
              "Akses Fitur Perpustakaan",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1,
            ),
            physics: const BouncingScrollPhysics(),
            children: const [
              LibraryMenu(
                icon: Icons.person_pin_outlined,
                label: "Keanggotaan",
                code: 'member',
              ),
              LibraryMenu(
                icon: Icons.menu_book_sharp,
                label: "Katalog",
                code: 'catalog',
              ),
              LibraryMenu(
                icon: Icons.book_online_sharp,
                label: "Booking",
                code: 'booking',
              ),
              LibraryMenu(
                icon: Icons.bookmark_add_sharp,
                label: "Dipinjam",
                code: 'borrow',
              ),
              LibraryMenu(
                icon: Icons.bookmark_remove_sharp,
                label: "Dikembalikan",
                code: 'return',
              ),
              LibraryMenu(
                icon: Icons.bookmark_outline_sharp,
                label: "Hilang",
                code: 'loss',
              ),
              LibraryMenu(
                icon: Icons.local_library_sharp,
                label: "Kunjungan",
                code: 'visitor',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
