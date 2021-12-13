import 'package:get/get.dart';
import 'package:pos_laundry/app/core/values/strings.dart';
import 'package:pos_laundry/app/data/models/data_service/data_service_model.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // Konfigurasi httpClient
    httpClient.baseUrl = baseUrl;
    httpClient.defaultContentType = contentType;
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.maxAuthRetries = 3;
    super.onInit();
  }

  // Ambil data service dari API
  Future<List<DataService>> getDataServices() async {
    final body = FormData({'jwt': jwtToken});

    Response response = await post('/layanan', body);

    if (response.statusCode == 200) {
      List<DataService> data =
          (response.body as List).map((e) => DataService.fromJson(e)).toList();
      return data;
    }

    return [];
  }
}
