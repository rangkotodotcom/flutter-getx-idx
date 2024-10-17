import 'package:flutter/material.dart';
import 'package:myapp/app/constants/color.dart';

class PermitListComponent extends StatelessWidget {
  const PermitListComponent({
    super.key,
    required this.id,
    required this.status,
    required this.statusStr,
    required this.permitDateStr,
    required this.permitCategoryName,
    required this.description,
    required this.fileName,
    required this.fileBase,
  });

  final String id;
  final String permitDateStr;
  final String permitCategoryName;
  final String description;
  final String status;
  final String statusStr;
  final String fileName;
  final String fileBase;

  @override
  Widget build(BuildContext context) {
    var colorStatus = Colors.amber;

    if (status == 'a') {
      colorStatus = Colors.green;
    } else if (status == 'r') {
      colorStatus = Colors.red;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      elevation: 2,
      child: InkWell(
        onTap: () => showModalBottomSheet(
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          useSafeArea: true,
          isScrollControlled: true,
          isDismissible: true,
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => _showDetailIzin(
              permitDateStr,
              permitCategoryName,
              fileBase,
              description,
              status,
              statusStr,
            ),
          ),
        ),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: colorBackGround,
              border: Border(
                left: BorderSide(
                  color: colorStatus,
                  width: 5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        permitDateStr,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorStatus,
                        ),
                        padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 2,
                          left: 5,
                          right: 5,
                        ),
                        child: Text(
                          statusStr,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$permitCategoryName : $description',
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _showDetailIzin(
  String permitDateStr,
  String permitCategoryName,
  String fileBase,
  String description,
  String status,
  String statusStr,
) =>
    DraggableScrollableSheet(
      expand: false,
      key: UniqueKey(),
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.6,
      builder: (context, controller) => SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              alignment: Alignment.center,
              child: const Text(
                "Detail Izin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              color: colorSmanel,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Tanggal",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    permitDateStr,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Jenis Izin",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    permitCategoryName,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Lampiran",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  fileBase != ''
                      ? Card(
                          child: InkWell(
                            onTap: () => dialogFoto(context, fileBase),
                            child: Container(
                              width: 100,
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Image.network(
                                'https://placehold.co/400/png',
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 2,
                        bottom: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: status == 'a'
                            ? Colors.green
                            : (status == 'r' ? Colors.red : Colors.amber),
                      ),
                      child: Text(
                        statusStr,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

dialogFoto(context, String fileBase) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(10),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            'https://placehold.co/400/png',
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              "Close",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
