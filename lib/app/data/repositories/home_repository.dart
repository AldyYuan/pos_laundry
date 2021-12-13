import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';

class HomeRepository {
  final FirestoreProvider provider;

  HomeRepository(this.provider);

  Stream<List<TransactionModel>> snapshotsRecentTransactions() {
    return provider.snapshotsRecentTransaction().map(
          (event) => event.docs
              .map((e) => TransactionModel.fromJson(e.data()))
              .toList(),
        );
  }

  Stream<List<TransactionModel>> snapshotsTransactions() {
    return provider.snapshotsTransaction().map(
          (event) => event.docs
              .map((e) => TransactionModel.fromJson(e.data()))
              .toList(),
        );
  }
}
