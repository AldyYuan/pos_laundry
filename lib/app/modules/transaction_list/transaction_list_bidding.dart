import 'package:get/get.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';
import 'package:pos_laundry/app/data/repositories/transaction_list_repository.dart.dart';

import 'transaction_list_controller.dart';

class TransactionListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionListController>(
      () => TransactionListController(
        TransactionListRepository(
          FirestoreProvider(),
        ),
      ),
    );
  }
}
