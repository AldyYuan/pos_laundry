import 'package:get/get.dart';

import 'package:pos_laundry/app/data/providers/firestore_provider.dart';
import 'package:pos_laundry/app/data/repositories/home_repository.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(HomeRepository(FirestoreProvider())));
  }
}
