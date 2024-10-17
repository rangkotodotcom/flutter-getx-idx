import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/app/constants/color.dart';
import 'package:myapp/app/helpers/image_helper.dart';
import '../controllers/permit_controller.dart';

class PermitCreateView extends GetView<PermitController> {
  const PermitCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> showCalendar() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDatePickerMode: DatePickerMode.day,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 45),
        ),
      );

      if (pickedDate != null) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        String formattedDateStr = DateFormat('d MMMM y').format(pickedDate);

        controller.permitDate.value = formattedDate;
        controller.permitDateStr.text = formattedDateStr;
      }
    }

    Future<void> uploadAttachment() async {
      FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
      );

      if (filePickerResult != null) {
        PlatformFile file = filePickerResult.files.first;
        double fileSize = file.size / (1024 * 1024); // Convert to MB
        String? filePath = file.path;

        if (fileSize > 2) {
          Get.snackbar('Error', 'Ukuran File Terlalu Besar',
              snackPosition: SnackPosition.BOTTOM);
          return;
        }

        if (filePath != null) {
          String fileBase = await ImageConstants().convertToBase64(filePath);

          controller.attachmentName.text = file.name;
          controller.attachment.value = fileBase;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajukan Izin'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.red,
                ),
                child: const Text(
                  "Pengajuan izin hanya bisa dilakukan 1 kali untuk tanggal yang sama.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Jenis Izin",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: Get.width,
                child: FutureBuilder<List<PermitCategory>>(
                  future: controller.fetchPermitCategoryData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton(
                          onChanged: null,
                          items: const [
                            DropdownMenuItem(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Kategori Tidak Ditemukan'),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (snapshot.hasData && snapshot.data != null) {
                      var data = snapshot.data!;
                      return Obx(() => DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: const Text("Pilih Jenis Izin"),
                              value: controller.selectedCategoryId.value == '0'
                                  ? null
                                  : controller.selectedCategoryId.value,
                              onChanged: (value) {
                                controller.selectedCategoryId.value = value!;
                              },
                              items: data
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name.toString()),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ));
                    }

                    return const Center(child: Text("Data Tidak Tersedia"));
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Tanggal Izin",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: colorSmanel, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.permitDateStr,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pilih Tanggal',
                        ),
                        readOnly: true,
                        onTap: () => showCalendar(),
                      ),
                    ),
                    InkWell(
                      onTap: () => showCalendar(),
                      child: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Lampiran",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: colorSmanel, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.attachmentName,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pilih Lampiran',
                        ),
                        readOnly: true,
                        onTap: () => uploadAttachment(),
                      ),
                    ),
                    InkWell(
                      onTap: () => uploadAttachment(),
                      child: const Icon(Icons.file_copy),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Keterangan Tambahan",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: colorSmanel, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: controller.description,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Deskripsi',
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Obx(
                () => MaterialButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  color: colorSmanel,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.isLoading.value = true;
                          controller.submitPermit();
                        },
                  child: Center(
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: colorSmanel,
                          )
                        : const Text(
                            "Kirim Pengajuan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
