import 'package:get/get.dart';
import 'package:pos_laundry/app/modules/home/home_binding.dart';
import 'package:pos_laundry/app/modules/home/home_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
