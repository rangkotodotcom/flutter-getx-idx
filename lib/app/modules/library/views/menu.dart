import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LibraryMenu extends StatelessWidget {
  const LibraryMenu({
    super.key,
    required this.icon,
    required this.label,
    required this.code,
  });

  final IconData icon;
  final String label;
  final String code;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (code == 'member') {
          Get.toNamed(Routes.LIBRARY_MEMBER);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                )
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
