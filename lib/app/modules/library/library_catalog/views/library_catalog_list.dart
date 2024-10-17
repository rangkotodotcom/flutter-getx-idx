import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/helpers/image_helper.dart';
import 'package:myapp/app/modules/library/library_catalog/views/library_catalog_detail_view.dart';

class LibraryCatalogListComponent extends StatelessWidget {
  const LibraryCatalogListComponent({super.key,
    required this.book,
    });

    final LibraryBookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => const LibraryCatalogDetailView(),
        arguments: {
          "id": book.id,
          "title": book.title,
        },
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.memory(
              ImageConstants().decodeBase64(book.image.fileBase),
              fit: BoxFit.cover,
              height: Get.height * (20 / 100),
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            book.authorName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            book.publisherName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}