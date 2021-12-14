import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

import 'package:pos_laundry/app/data/models/service/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          leading: const CircleAvatar(
            backgroundColor: grey,
            child: Icon(
              Icons.local_laundry_service_rounded,
              color: black,
            ),
          ),
          title: Text(service.namaLayanan),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Jumlah Pesanan: ${service.jumlahPembelian}"),
              Text("Harga Layanan: ${NumberFormat.simpleCurrency(
                locale: 'id_ID',
                decimalDigits: 0,
              ).format(service.hargaLayanan)}"),
              Text("Harga Total: ${NumberFormat.simpleCurrency(
                locale: 'id_ID',
                decimalDigits: 0,
              ).format(service.hargaTotal)}"),
            ],
          ),
        ),
      ),
    );
  }
}
