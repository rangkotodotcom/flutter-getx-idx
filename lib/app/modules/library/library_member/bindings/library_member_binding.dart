import 'package:get/get.dart';

import '../controllers/library_member_controller.dart';

class LibraryMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryMemberController>(
      () => LibraryMemberController(),
    );
  }
}
