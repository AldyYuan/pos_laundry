import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';

class DateCard extends StatelessWidget {
  final TransactionModel transaction;
  const DateCard({Key? key, required this.transaction}) : super(key: key);

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
          leading: const CircleAvatar(
            backgroundColor: grey,
            child: Icon(
              Icons.date_range_rounded,
              color: black,
            ),
          ),
          title: const Text("Estimasi selesai"),
          subtitle: Text(
              "${DateFormat("EEE, dd MMM").format(transaction.tglBuat!)} - ${DateFormat("EEE, dd MMM").format(transaction.tglSelesai!)}"),
        ),
      ),
    );
  }
}
