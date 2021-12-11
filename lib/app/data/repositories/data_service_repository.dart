import 'package:pos_laundry/app/data/models/data_service/data_service_model.dart';
import 'package:pos_laundry/app/data/providers/api_provider.dart';

class DataServiceRepository {
  final ApiProvider provider;

  DataServiceRepository(this.provider);

  Future<List<DataService>> getDataServices() async =>
      await provider.getDataServices();
}
