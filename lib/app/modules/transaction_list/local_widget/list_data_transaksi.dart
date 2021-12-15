import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/global_widgets/transaction_card.dart';

import 'package:pos_laundry/app/modules/transaction_list/transaction_list_controller.dart';

class ListDataTransaksi extends StatelessWidget {
  const ListDataTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionListController>();
    return Obx(
      () => controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.isSearching && controller.searchList.isEmpty
              ? const Center(
                  child: Text(
                    "Data transaksi tidak ada, coba dengan kata kunci lain.",
                  ),
                )
              : controller.searchList.isNotEmpty
                  ? Column(
                      children: controller.searchList
                          .map((e) => TransactionCard(transaction: e))
                          .toList(),
                    )
                  : Column(
                      children: controller.transactions
                          .map((e) => TransactionCard(transaction: e))
                          .toList(),
                    ),
    );
  }
}
