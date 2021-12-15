import 'package:get/get.dart';
import 'package:pos_laundry/app/modules/add_transaction/add_transaction_bidding.dart';
import 'package:pos_laundry/app/modules/add_transaction/add_transaction_page.dart';
import 'package:pos_laundry/app/modules/choose_service/choose_service.page.dart';
import 'package:pos_laundry/app/modules/choose_service/choose_service_binding.dart';
import 'package:pos_laundry/app/modules/detail_transaction/detail_transaction_bidding.dart';
import 'package:pos_laundry/app/modules/detail_transaction/detail_transaction_page.dart';
import 'package:pos_laundry/app/modules/home/home_binding.dart';
import 'package:pos_laundry/app/modules/home/home_page.dart';
import 'package:pos_laundry/app/modules/review_transaction/review_transaction_bidding.dart';
import 'package:pos_laundry/app/modules/review_transaction/review_transaction_page.dart';
import 'package:pos_laundry/app/modules/transaction_list/transaction_list_bidding.dart';
import 'package:pos_laundry/app/modules/transaction_list/transaction_list_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.chooseService,
      page: () => const ChooseServicePage(),
      binding: ChooseServiceBinding(),
    ),
    GetPage(
      name: Routes.addTransaction,
      page: () => const AddTransactionPage(),
      binding: AddTransactionBinding(),
    ),
    GetPage(
      name: Routes.reviewTransaction,
      page: () => const ReviewTransactionPage(),
      binding: ReviewTransactionBinding(),
    ),
    GetPage(
      name: Routes.transactionList,
      page: () => const TransactionListPage(),
      binding: TransactionListBinding(),
    ),
    GetPage(
      name: Routes.detailTransaction,
      page: () => const DetailTransactionPage(),
      binding: DetailTransactionBinding(),
    ),
  ];
}
