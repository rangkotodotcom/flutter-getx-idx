import 'package:get/get.dart';

import '../controllers/library_return_controller.dart';

class LibraryReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryReturnController>(
      () => LibraryReturnController(),
    );
  }
}
