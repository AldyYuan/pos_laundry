import 'package:get/get.dart';
import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/repositories/detail_transaction_repository.dart';

class DetailTransactionController extends GetxController {
  final DetailTransactionRepository repository;
  DetailTransactionController(this.repository);

  final Rx<List<ServiceModel>> _services = Rx<List<ServiceModel>>([]);
  List<ServiceModel> get services => _services.value;

  final Rx<bool> _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  getServices(String idTransaction) async {
    _isLoading.value = true;
    _services.value = await repository.getServices(idTransaction);
    _isLoading.value = false;
  }
}
