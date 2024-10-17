import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/library/bindings/library_binding.dart';
import '../modules/library/library_member/bindings/library_member_binding.dart';
import '../modules/library/library_member/views/library_member_view.dart';
import '../modules/library/views/library_view.dart';
import '../modules/permit/bindings/permit_binding.dart';
import '../modules/permit/views/permit_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LIBRARY;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PERMIT,
      page: () => const PermitView(),
      binding: PermitBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => const LibraryView(),
      binding: LibraryBinding(),
      children: [
        GetPage(
          name: _Paths.LIBRARY_MEMBER,
          page: () => const LibraryMemberView(),
          binding: LibraryMemberBinding(),
        ),
      ],
    ),
  ];
}
