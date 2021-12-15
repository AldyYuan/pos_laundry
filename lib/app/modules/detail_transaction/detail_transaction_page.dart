import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/global_widgets/date_card.dart';
import 'package:pos_laundry/app/global_widgets/service_card.dart';
import 'package:pos_laundry/app/modules/detail_transaction/detail_transaction_controller.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailTransactionController>();

    // Data transaksi dari argument
    TransactionModel transaction = Get.arguments;

    // Ambil data layanan transaksi
    controller.getServices(transaction.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Transaksi"),
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
                      // Nama Pelanggan
                      ListTile(
                        title: Text('${transaction.namaCustomer}'),
                        subtitle: const Text("Nama Pelanggan"),
                      ),

                      // Pilihan Layanan
                      ListTile(
                        title: const Text(
                          "Layanan yang dipesan : ",
                        ),
                        subtitle: Column(
                          children: controller.services
                              .map((e) => ServiceCard(service: e))
                              .toList(),
                        ),
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),
                      // Estimasi Selesai
                      ListTile(
                        title: DateCard(transaction: transaction),
                      ),

                      // Keterangan
                      ListTile(
                        title: Text(transaction.keterangan ?? "Kosong"),
                        subtitle: const Text("Keterangan"),
                      ),

                      // Total Tagihan
                      ListTile(
                        title: Text(
                          NumberFormat.simpleCurrency(
                            locale: 'id_ID',
                          ).format(transaction.totalTagihan),
                        ),
                        subtitle: const Text("Total Tagihan"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
