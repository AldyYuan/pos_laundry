import 'package:get/get.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/data/repositories/review_transaction_repository.dart';

class ReviewTransactionController extends GetxController {
  final ReviewTransactionRepository repository;
  ReviewTransactionController(this.repository);

  final Rx<bool> _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  save({
    required TransactionModel transaction,
    required List<ServiceModel> services,
  }) async {
    _isLoading.value = true;

    try {
      // Simpan data transaksi ke dalam koleksi transaksi
      await repository.saveTransaction(transaction);

      // Simpan setiap data layanan ke dalam koleksi layanan
      await Future.forEach<ServiceModel>(services, (element) async {
        await repository.saveService(element);
      });
    } catch (e) {
      Get.snackbar(
        'Something went wrong',
        e.toString(),
        backgroundColor: red,
        colorText: white,
      );
      _isLoading.value = false;
      return;
    }

    _isLoading.value = false;
    Get.offAllNamed('/');
  }
}
