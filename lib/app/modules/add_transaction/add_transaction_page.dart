import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/core/themes/text_theme.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/modules/add_transaction/add_transaction_controller.dart';
import 'package:pos_laundry/app/modules/add_transaction/local_widgets/choose_service.dart';

import 'local_widgets/choose_date.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AddTransactionController>();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buat Transaksi"),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () {
            if (_controller.services.isEmpty ||
                _controller.transaction.tglBuat == null) {
              Get.snackbar(
                'Tidak bisa lanjut',
                'Data transaksi masih ada yang kosong',
                backgroundColor: primaryDark,
                colorText: white,
              );
              return;
            }
            if (_formKey.currentState!.validate()) {}
          },
          label: Text(
            "Lanjut",
            style: bold.copyWith(
              color: white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nama Pelanggan',
                  ),
                  onChanged: (value) => _controller.setNamaCustomer(value),
                  validator: (value) {
                    if (value == null || value == "") {
                      return 'Nama Pelanggan tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Pilih layanan
                const ChooseService(),
                const SizedBox(height: 16.0),

                // Pilih Tanggal Transaksi
                const ChooseDate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
