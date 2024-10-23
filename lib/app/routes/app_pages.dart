import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/library/bindings/library_binding.dart';
import '../modules/library/library_booking/bindings/library_booking_binding.dart';
import '../modules/library/library_booking/views/library_booking_view.dart';
import '../modules/library/library_borrow/bindings/library_borrow_binding.dart';
import '../modules/library/library_borrow/views/library_borrow_view.dart';
import '../modules/library/library_catalog/bindings/library_catalog_binding.dart';
import '../modules/library/library_catalog/views/library_catalog_view.dart';
import '../modules/library/library_loss/bindings/library_loss_binding.dart';
import '../modules/library/library_loss/views/library_loss_view.dart';
import '../modules/library/library_member/bindings/library_member_binding.dart';
import '../modules/library/library_member/views/library_member_view.dart';
import '../modules/library/library_return/bindings/library_return_binding.dart';
import '../modules/library/library_return/views/library_return_view.dart';
import '../modules/library/library_visitor/bindings/library_visitor_binding.dart';
import '../modules/library/library_visitor/views/library_visitor_view.dart';
import '../modules/library/views/library_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/permit/bindings/permit_binding.dart';
import '../modules/permit/views/permit_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NOTIFICATION;

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
        GetPage(
          name: _Paths.LIBRARY_CATALOG,
          page: () => const LibraryCatalogView(),
          binding: LibraryCatalogBinding(),
        ),
        GetPage(
          name: _Paths.LIBRARY_BOOKING,
          page: () => const LibraryBookingView(),
          binding: LibraryBookingBinding(),
        ),
        GetPage(
          name: _Paths.LIBRARY_BORROW,
          page: () => const LibraryBorrowView(),
          binding: LibraryBorrowBinding(),
        ),
        GetPage(
          name: _Paths.LIBRARY_RETURN,
          page: () => const LibraryReturnView(),
          binding: LibraryReturnBinding(),
        ),
        GetPage(
          name: _Paths.LIBRARY_LOSS,
          page: () => const LibraryLossView(),
          binding: LibraryLossBinding(),
        ),
        GetPage(
          name: _Paths.LIBRARY_VISITOR,
          page: () => const LibraryVisitorView(),
          binding: LibraryVisitorBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
