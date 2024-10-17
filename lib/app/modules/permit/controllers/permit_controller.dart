import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermitController extends GetxController {
  // List to hold permit data
  List<Permit> permits = [];
  List<PermitCategory> permitsCategory = [];

  var selectedCategoryId = '0'.obs;
  var permitDate = ''.obs;
  var permitDateStr = TextEditingController(); // Text field controller for date
  var attachment = ''.obs;
  var attachmentName =
      TextEditingController(); // Text field controller for attachment name
  var description =
      TextEditingController(); // Text field controller for description
  var isLoading = false.obs; // Loading indicator flag

  // Method to fetch permit data (simulated with Future)
  Future<List<Permit>> fetchPermitData() async {
    // Simulate network call
    await Future.delayed(const Duration(seconds: 2));

    // Return dummy permit data or fetch from API
    permits = [
      Permit(
        id: '1',
        status: 'a',
        statusStr: 'Approved',
        permitDateStr: '14 Oktober 2024',
        permitCategoryName: 'Izin',
        description: 'Beralat',
        fileName: 'fileName',
        fileBase: 'fileBase',
      ),
      // Add more permits here
    ];
    return permits;
  }

  // Method to refresh permit data
  Future<void> refreshData() async {
    // Fetch the latest data
    await fetchPermitData();
    update(); // Notify listeners about the changes
  }

  // Method to fetch permit data (simulated with Future)
  Future<List<PermitCategory>> fetchPermitCategoryData() async {
    // Simulate network call
    await Future.delayed(const Duration(seconds: 2));

    // Return dummy permit data or fetch from API
    permitsCategory = [
      PermitCategory(
        id: '1',
        name: 'Izin',
      ),
      // Add more permits here
    ];
    return permitsCategory;
  }

  void submitPermit() async {
    try {
      // Validate fields (example validation)
      if (permitDate.isEmpty) {
        Get.snackbar('Error', 'Tanggal Izin tidak boleh kosong',
            snackPosition: SnackPosition.BOTTOM);
        isLoading.value = false;
        return;
      }
      if (selectedCategoryId.value == '0') {
        Get.snackbar('Error', 'Jenis Izin harus dipilih',
            snackPosition: SnackPosition.BOTTOM);
        isLoading.value = false;
        return;
      }

      if (description.text == '') {
        Get.snackbar('Error', 'deskripsi kosong',
            snackPosition: SnackPosition.BOTTOM);
        isLoading.value = false;
        return;
      }

      print(selectedCategoryId.value);
      print(permitDate);
      print(permitDateStr.text);
      print(attachmentName.text);
      print(description.text);
      print(attachment.value);

      // Simulate form submission
      await Future.delayed(const Duration(seconds: 2));

      // Success
      Get.back();
      Get.snackbar('Success', 'Pengajuan izin berhasil dikirim',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      // Handle error during submission
      Get.snackbar('Error', 'Terjadi kesalahan saat mengirim pengajuan',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Ensure loading is stopped
    }
  }
}

class Permit {
  final String id;
  final String status;
  final String statusStr;
  final String permitDateStr;
  final String permitCategoryName;
  final String description;
  final String fileName;
  final String fileBase;

  Permit({
    required this.id,
    required this.status,
    required this.statusStr,
    required this.permitDateStr,
    required this.permitCategoryName,
    required this.description,
    required this.fileName,
    required this.fileBase,
  });
}

class PermitCategory {
  final String id;
  final String name;

  PermitCategory({
    required this.id,
    required this.name,
  });
}
