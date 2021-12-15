import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/core/values/strings.dart';
import 'package:pos_laundry/app/data/models/data_service/data_service_model.dart';
import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';

import 'package:pos_laundry/app/routes/app_pages.dart';

class AddTransactionController extends GetxController {
  AddTransactionController();

  late final Rx<TransactionModel> _transaction;
  TransactionModel get transaction => _transaction.value;

  final Rx<List<ServiceModel>> _services = Rx<List<ServiceModel>>([]);
  List<ServiceModel> get services => _services.value;

  final Rx<int> _finishTime = 0.obs;

  @override
  void onInit() {
    // Initialize transaction dengan random ID
    _transaction = TransactionModel(
      id: getRandomGeneratedId(),
    ).obs;

    super.onInit();
  }

  setNamaCustomer(String value) {
    _transaction.value.namaCustomer = value;
  }

  setKeterangan(String value) {
    _transaction.value.keterangan = value;
  }

  chooseService() async {
    var result = await Get.toNamed(Routes.chooseService);

    if (result != null) {
      debugPrint("Result: " + result.toString());

      // Result dari pilih layanan
      DataService dataService = DataService.fromJson(result['data_service']);
      int totalService = result['total'];

      // Total tagihan transaksi
      double hargaTotal = totalService * dataService.harga;
      _transaction.value.totalTagihan += hargaTotal;

      // Durasi penyelesaian paling lama
      _finishTime.value = _finishTime.value >= dataService.durasiPenyelesaian
          ? _finishTime.value
          : dataService.durasiPenyelesaian;

      if (_transaction.value.tglBuat != null) {
        DateTime startDate = _transaction.value.tglBuat!;
        Duration time = Duration(milliseconds: _finishTime.value);
        DateTime endDate = startDate.add(time);

        _transaction.value.tglBuat = startDate;
        _transaction.value.tglSelesai = endDate;

        _transaction.refresh();
      }

      // Check layanan yang sama
      if (_services.value
          .any((element) => element.idLayanan == dataService.idLayanan)) {
        // Index data layanan yang sama
        int index = _services.value.indexWhere(
            (element) => element.idLayanan == dataService.idLayanan);

        // Update jumlah pembelian dan harga total
        _services.value[index].jumlahPembelian += totalService;
        _services.value[index].hargaTotal += hargaTotal;
        _services.refresh();
        return;
      }

      // Data yang disimpan pada layanan saat transaksi
      ServiceModel data = ServiceModel(
        getRandomGeneratedId(),
        dataService.idLayanan,
        _transaction.value.id,
        dataService.namaLayanan,
        totalService,
        dataService.harga,
        hargaTotal,
      );
      _services.value.add(data);
      _services.refresh();
    }
  }

  chooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2077),
    );

    if (pickedDate != null) {
      // Tgl mulai dan selesai
      DateTime startDate = pickedDate;
      Duration time = Duration(milliseconds: _finishTime.value);
      DateTime endDate = startDate.add(time);

      _transaction.value.tglBuat = startDate;
      _transaction.value.tglSelesai = endDate;

      _transaction.refresh();
    }
  }

  deleteService(ServiceModel data) {
    _services.value.remove(data);
    _services.refresh();
  }
}
