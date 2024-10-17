import 'package:get/get.dart';

import '../controllers/library_booking_controller.dart';

class LibraryBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryBookingController>(
      () => LibraryBookingController(),
    );
  }
}
