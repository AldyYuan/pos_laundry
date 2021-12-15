import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';

class TransactionRepository {
  final FirestoreProvider provider;

  TransactionRepository(this.provider);

  Future<List<TransactionModel>> getTransactions() async {
    final data = await provider.getTransactionCollection();

    // Check jika data transaksi tidak kosong
    if (data.docs.isNotEmpty) {
      List<TransactionModel> transactions =
          data.docs.map((e) => TransactionModel.fromJson(e.data())).toList();
      return transactions;
    }

    return [];
  }
}
