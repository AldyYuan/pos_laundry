import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';

class DetailTransactionRepository {
  final FirestoreProvider provider;

  DetailTransactionRepository(this.provider);

  Future<List<ServiceModel>> getServices(String id) async {
    final data = await provider.getServiceCollection(id);

    // Check jika data service tidak kosong
    if (data.docs.isNotEmpty) {
      List<ServiceModel> services =
          data.docs.map((e) => ServiceModel.fromJson(e.data())).toList();
      return services;
    }

    return [];
  }
}
