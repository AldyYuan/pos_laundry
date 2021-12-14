import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/data/models/data_service/data_service_model.dart';
import 'package:pos_laundry/app/modules/choose_service/choose_service_controller.dart';

class Confirmation extends StatelessWidget {
  final DataService dataService;

  const Confirmation({
    Key? key,
    required this.dataService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChooseServiceController>();

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text("Tambah ${dataService.namaLayanan}"),
      content: TextFormField(
        decoration: InputDecoration(
          labelText: 'Jumlah (${dataService.namaSatuan})',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) => controller.setTotal = int?.tryParse(value) ?? 1,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text('Batal'.tr),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: Text('Tambah'.tr),
        )
      ],
    );
  }
}
