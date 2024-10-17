import 'package:flutter/material.dart';
import 'package:myapp/app/helpers/image_helper.dart';

class LibraryLossListComponent extends StatelessWidget {
  const LibraryLossListComponent({
    super.key,
    required this.id,
    required this.bookId,
    required this.bookCode,
    required this.bookTitle,
    required this.bookNumber,
    required this.borrowAtStr,
    required this.purposeBorrowStr,
    required this.lossAtStr,
    required this.lossCharge,
    required this.lossChargeStr,
    required this.status,
    required this.statusStr,
    required this.fileName,
    required this.fileBase,
  });

  final String id;
  final String bookId;
  final String bookCode;
  final String bookTitle;
  final String bookNumber;
  final String borrowAtStr;
  final String purposeBorrowStr;
  final String lossAtStr;
  final String fileName;
  final String fileBase, lossChargeStr, status, statusStr;
  final int lossCharge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Dipinjam Pada",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    borrowAtStr,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hilang Pada",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    lossAtStr,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  ImageConstants().decodeBase64(fileBase),
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      bookCode,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      bookNumber,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         const Text(
          //           "Denda Hilang",
          //           style: TextStyle(
          //             fontSize: 10,
          //           ),
          //         ),
          //         Text(
          //           lossChargeStr,
          //           style: const TextStyle(
          //             fontSize: 12,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //     Container(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 5,
          //         vertical: 4,
          //       ),
          //       decoration: BoxDecoration(
          //         color: status == '1' ? Colors.green : Colors.red,
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Text(
          //         statusStr,
          //         style: const TextStyle(
          //           fontSize: 10,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}