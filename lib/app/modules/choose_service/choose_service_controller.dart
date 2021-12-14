import 'package:get/get.dart';
import 'package:pos_laundry/app/data/models/data_service/data_service_model.dart';

import 'package:pos_laundry/app/data/repositories/data_service_repository.dart';
import 'package:pos_laundry/app/modules/choose_service/local_widgets/confirmation.dart';

class ChooseServiceController extends GetxController {
  final DataServiceRepository repository;
  ChooseServiceController(this.repository);

  final Rx<List<DataService>> _dataServices = Rx<List<DataService>>([]);
  List<DataService> get dataService => _dataServices.value;

  final Rx<List<DataService>> _searchList = Rx<List<DataService>>([]);
  List<DataService> get searchList => _searchList.value;

  final Rx<int> _total = 0.obs;
  set setTotal(int value) => _total.value = value;

  final Rx<bool> _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  final Rx<bool> _isSearching = false.obs;
  bool get isSearching => _isSearching.value;

  getDataServices() async {
    _isLoading.value = true;
    _dataServices.value = await repository.getDataServices();
    _isLoading.value = false;
  }

  @override
  void onInit() {
    getDataServices();
    super.onInit();
  }

  pickDataService(DataService value) async {
    bool? confirmation = await Get.dialog<bool>(
      Confirmation(dataService: value),
      barrierDismissible: false,
    );

    // Check konfirmasi
    if (confirmation!) {
      Map<String, dynamic> data = {
        'data_service': value.toJson(),
        'total': _total.value == 0 ? 1 : _total.value,
      };

      // Back dengan data layanan dan total, yang sudah dipilih
      Get.back(result: data);

      return;
    }
  }

  search(String query) {
    _searchList.value.clear();

    // Check query jika kosong
    if (query.isEmpty) {
      _isSearching.value = false;
    } else {
      _isSearching.value = true;

      // Menambahkan data layanan dimana nama layanan cocok dengan query
      _searchList.value.assignAll(_dataServices.value
          .where((element) => element.namaLayanan.contains(query)));
    }

    // Refresh UI
    _searchList.refresh();
  }
}
