import 'package:get/get.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/data/repositories/transaction_list_repository.dart.dart';

class TransactionListController extends GetxController {
  final TransactionListRepository repository;
  TransactionListController(this.repository);

  final Rx<List<TransactionModel>> _transactions =
      Rx<List<TransactionModel>>([]);
  List<TransactionModel> get transactions => _transactions.value;

  final Rx<List<TransactionModel>> _searchList = Rx<List<TransactionModel>>([]);
  List<TransactionModel> get searchList => _searchList.value;

  final Rx<bool> _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final Rx<bool> _isSearching = false.obs;
  bool get isSearching => _isSearching.value;

  getTransaction() async {
    _isLoading.value = true;
    _transactions.value = await repository.getTransaction();
    _isLoading.value = false;
  }

  @override
  void onInit() {
    getTransaction();
    super.onInit();
  }

  search(String query) {
    _searchList.value.clear();

    // Check query jika kosong
    if (query.isEmpty) {
      _isSearching.value = false;
    } else {
      _isSearching.value = true;

      // Menambahkan data transaksi dimana nama customer cocok dengan query
      _searchList.value.assignAll(
        _transactions.value.where(
          (element) => element.namaCustomer!.contains(query),
        ),
      );
    }

    // Refresh UI
    _searchList.refresh();
  }
}
