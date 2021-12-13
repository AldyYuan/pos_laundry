import 'package:flutter/material.dart';
import 'package:pos_laundry/app/modules/home/local_widgets/income_card.dart';
import 'package:pos_laundry/app/modules/home/local_widgets/menu_button.dart';
import 'package:pos_laundry/app/modules/home/local_widgets/recent_transaction_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Card pendapatan
            IncomeCard(),

            // Tombol menu
            MenuButton(),

            // Daftar transaksi terbaru
            RecentTransactionList(),
          ],
        ),
      ),
    );
  }
}
