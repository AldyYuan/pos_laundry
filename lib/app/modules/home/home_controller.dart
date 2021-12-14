import 'package:get/get.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);

  final Rx<List<TransactionModel>> _allTransaction =
      Rx<List<TransactionModel>>([]);

  final Rx<List<TransactionModel>> _recentTransaction =
      Rx<List<TransactionModel>>([]);
  List<TransactionModel> get recentTransaction => _recentTransaction.value;

  final Rx<double> _income = 0.0.obs;
  double get income => _income.value;

  final Rx<bool> _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    _isLoading.value = true;

    _allTransaction.bindStream(repository.snapshotsTransactions());
    _recentTransaction.bindStream(repository.snapshotsRecentTransactions());

    // Setiap ada perubahan data di koleksi transaksi maka method ini akan dipanggil
    ever<List<TransactionModel>>(_allTransaction, (data) {
      _income.value = 0;

      if (data.isEmpty) return;

      // Menghitung total pendapatan dari setiap total tagihan transaksi
      for (var element in data) {
        _income.value += element.totalTagihan!;
      }
    });

    _isLoading.value = false;
    super.onInit();
  }
}
