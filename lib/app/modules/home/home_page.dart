import 'package:flutter/material.dart';
import 'package:pos_laundry/app/modules/home/local_widgets/income_card.dart';
import 'package:pos_laundry/app/modules/home/local_widgets/menu_button.dart';
import 'package:pos_laundry/app/modules/home/local_widgets/recent_transaction_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Card pendapatan
              IncomeCard(),
              SizedBox(height: 32.0),

              // Tombol menu
              MenuButton(),
              SizedBox(height: 16.0),

              // Daftar transaksi terbaru
              RecentTransactionList(),
            ],
          ),
        ),
      ),
    );
  }
}
