import 'package:get/get.dart';

import '../controllers/library_visitor_controller.dart';

class LibraryVisitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryVisitorController>(
      () => LibraryVisitorController(),
    );
  }
}
