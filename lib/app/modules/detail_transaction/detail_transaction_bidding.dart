import 'package:get/get.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';
import 'package:pos_laundry/app/data/repositories/detail_transaction_repository.dart';

import 'detail_transaction_controller.dart';

class DetailTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransactionController>(
      () => DetailTransactionController(
        DetailTransactionRepository(
          FirestoreProvider(),
        ),
      ),
    );
  }
}
