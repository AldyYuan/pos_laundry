import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/modules/transaction_list/local_widget/list_data_transaksi.dart';
import 'package:pos_laundry/app/modules/transaction_list/transaction_list_controller.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionListController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Transaksi"),
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Cari Pelanggan',
                          prefixIcon: Icon(Icons.search_rounded),
                        ),
                        onChanged: (value) => controller.search(value),
                      ),
                      const SizedBox(height: 16.0),

                      // List data transaksi
                      const ListDataTransaksi(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
