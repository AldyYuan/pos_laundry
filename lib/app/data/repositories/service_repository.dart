import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/providers/firestore_provider.dart';

class ServiceRepository {
  final FirestoreProvider provider;

  ServiceRepository(this.provider);

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

  Future<void> saveService(ServiceModel data) async =>
      await provider.saveService(data);
}
