import 'package:get/get.dart';

import '../controllers/library_borrow_controller.dart';

class LibraryBorrowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryBorrowController>(
      () => LibraryBorrowController(),
    );
  }
}
