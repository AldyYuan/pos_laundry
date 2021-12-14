import 'package:get/get.dart';
import 'package:pos_laundry/app/modules/add_transaction/add_transaction_controller.dart';

class AddTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTransactionController>(
      () => AddTransactionController(),
    );
  }
}
