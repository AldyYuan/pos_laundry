import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/core/themes/text_theme.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/global_widgets/service_card.dart';
import 'package:pos_laundry/app/modules/add_transaction/add_transaction_controller.dart';

class ChooseService extends StatelessWidget {
  const ChooseService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AddTransactionController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          color: primaryShade,
          textColor: white,
          padding: const EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          onPressed: () => _controller.chooseService(),
          child: const Text("Pilih Layanan"),
        ),
        const SizedBox(height: 8.0),
        const Text(
          "Pilihan :",
          style: bold,
        ),
        const SizedBox(height: 4.0),
        Obx(
          () => _controller.services.isEmpty
              ? const Text("Pilihan masih kosong")
              : Column(
                  children: _controller.services
                      .map((e) => ServiceCard(service: e))
                      .toList(),
                ),
        ),
      ],
    );
  }
}
