import 'package:get/get.dart';

import '../controllers/library_catalog_controller.dart';

class LibraryCatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryCatalogController>(
      () => LibraryCatalogController(),
    );
  }
}
