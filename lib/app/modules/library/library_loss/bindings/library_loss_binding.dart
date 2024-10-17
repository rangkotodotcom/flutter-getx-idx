import 'package:get/get.dart';

import '../controllers/library_loss_controller.dart';

class LibraryLossBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryLossController>(
      () => LibraryLossController(),
    );
  }
}
