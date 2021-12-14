import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/modules/choose_service/choose_service_controller.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChooseServiceController>();
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Cari Layanan',
        prefixIcon: Icon(Icons.search_rounded),
      ),
      onChanged: (value) => controller.search(value),
    );
  }
}
