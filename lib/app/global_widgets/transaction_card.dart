import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

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
          leading: const CircleAvatar(
            backgroundColor: grey,
            child: Icon(
              Icons.receipt_rounded,
              color: black,
            ),
          ),
          title: Text("${transaction.namaCustomer}"),
          subtitle: Text(
            DateFormat("EEE, dd MMM").format(transaction.tglBuat!),
          ),
          trailing: Text(
            "+${NumberFormat.simpleCurrency(
              locale: 'id_ID',
            ).format(transaction.totalTagihan)}",
            style: const TextStyle(
              color: green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
