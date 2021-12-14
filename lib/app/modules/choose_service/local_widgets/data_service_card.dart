import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/core/values/strings.dart';
import 'package:pos_laundry/app/data/models/data_service/data_service_model.dart';
import 'package:pos_laundry/app/modules/choose_service/choose_service_controller.dart';

class DataServiceCard extends StatelessWidget {
  final DataService data;
  const DataServiceCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ChooseServiceController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          isThreeLine: true,
          onTap: () => _controller.pickDataService(data),
          leading: const CircleAvatar(
            backgroundColor: grey,
            child: Icon(
              Icons.local_laundry_service_rounded,
              color: black,
            ),
          ),
          title: Text(data.namaLayanan),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Harga: ${NumberFormat.simpleCurrency(
                locale: 'id_ID',
                decimalDigits: 0,
              ).format(data.harga)}"),
              const SizedBox(height: 4.0),
              Text(
                "Durasi Penyelesaian: ${countDuration(Duration(milliseconds: data.durasiPenyelesaian))} / ${data.namaSatuan}",
              ),
            ],
          ),
          trailing: const Icon(
            Icons.navigate_next_rounded,
          ),
        ),
      ),
    );
  }
}
