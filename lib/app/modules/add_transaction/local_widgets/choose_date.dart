import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/global_widgets/date_card.dart';
import 'package:pos_laundry/app/modules/add_transaction/add_transaction_controller.dart';

class ChooseDate extends StatelessWidget {
  const ChooseDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AddTransactionController>();

    return Obx(
      () => _controller.services.isEmpty
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MaterialButton(
                  color: primaryShade,
                  textColor: white,
                  padding: const EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  onPressed: () => _controller.chooseDate(context),
                  child: const Text("Pilih Tanggal Transaksi"),
                ),
                const SizedBox(height: 8.0),
                _controller.transaction.tglBuat == null
                    ? Container()
                    : DateCard(transaction: _controller.transaction),
              ],
            ),
    );
  }
}
