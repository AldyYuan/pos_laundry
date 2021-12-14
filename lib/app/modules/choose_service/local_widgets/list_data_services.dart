import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_laundry/app/modules/choose_service/choose_service_controller.dart';
import 'package:pos_laundry/app/modules/choose_service/local_widgets/data_service_card.dart';

class ListDataServices extends StatelessWidget {
  const ListDataServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChooseServiceController>();
    return Obx(
      () => controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.isSearching && controller.searchList.isEmpty
              ? const Center(
                  child: Text(
                    "Data layanan tidak ada,\n coba dengan kata kunci lain.",
                  ),
                )
              : controller.searchList.isNotEmpty
                  ? Column(
                      children: controller.searchList
                          .map((e) => DataServiceCard(data: e))
                          .toList(),
                    )
                  : Column(
                      children: controller.dataService
                          .map((e) => DataServiceCard(data: e))
                          .toList(),
                    ),
    );
  }
}
