import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/core/themes/text_theme.dart';
import 'package:pos_laundry/app/global_widgets/transaction_card.dart';
import 'package:pos_laundry/app/modules/home/home_controller.dart';

class RecentTransactionList extends StatelessWidget {
  const RecentTransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transaksi Terbaru",
            style: bold,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16.0),
          Obx(
            () => _homeController.recentTransaction.isEmpty
                ? const Text(
                    "Belum ada transaksi terbaru",
                    textAlign: TextAlign.center,
                  )
                : Column(
                    children: _homeController.recentTransaction
                        .map((e) => TransactionCard(transaction: e))
                        .toList(),
                  ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
