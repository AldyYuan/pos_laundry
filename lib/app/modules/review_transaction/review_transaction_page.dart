import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_laundry/app/core/themes/text_theme.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/global_widgets/date_card.dart';
import 'package:pos_laundry/app/global_widgets/service_card.dart';
import 'package:pos_laundry/app/modules/review_transaction/review_transaction_controller.dart';

class ReviewTransactionPage extends StatelessWidget {
  const ReviewTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data argument
    Map<String, dynamic> argument = Get.arguments;

    // Data transaksi
    TransactionModel transaction =
        TransactionModel.fromJson(argument['transaction']);

    // Data layanan
    List<ServiceModel> services = (argument['services'] as List)
        .map((e) => ServiceModel.fromJson(e))
        .toList();

    final controller = Get.find<ReviewTransactionController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Transaksi"),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          onPressed: controller.isLoading
              ? null
              : () async => await controller.save(
                  transaction: transaction, services: services),
          label: controller.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  "Simpan Transaksi",
                  style: bold.copyWith(
                    color: white,
                  ),
                ),
          backgroundColor: controller.isLoading ? white : primaryColor,
        ),
      ),
      body: SingleChildScrollView(
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
                  children:
                      services.map((e) => ServiceCard(service: e)).toList(),
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
    );
  }
}
