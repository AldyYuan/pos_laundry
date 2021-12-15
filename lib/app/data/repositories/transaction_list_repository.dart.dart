import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';

class TransactionListRepository {
  final FirestoreProvider provider;

  TransactionListRepository(this.provider);

  Future<List<TransactionModel>> getTransaction() async {
    final data = await provider.getTransactionCollection();

    // Check data di firestore apakah kosong
    if (data.docs.isEmpty) return [];

    return data.docs.map((e) => TransactionModel.fromJson(e.data())).toList();
  }
}
