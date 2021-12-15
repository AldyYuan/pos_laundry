import 'package:get/get.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';
import 'package:pos_laundry/app/data/repositories/review_transaction_repository.dart';

import 'review_transaction_controller.dart';

class ReviewTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewTransactionController>(
      () => ReviewTransactionController(
        ReviewTransactionRepository(
          FirestoreProvider(),
        ),
      ),
    );
  }
}
