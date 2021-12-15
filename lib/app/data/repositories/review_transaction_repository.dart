import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';

class ReviewTransactionRepository {
  final FirestoreProvider provider;

  ReviewTransactionRepository(this.provider);

  Future<void> saveService(ServiceModel data) async =>
      await provider.saveService(data);

  Future<void> saveTransaction(TransactionModel data) async =>
      await provider.saveTransaction(data);
}
