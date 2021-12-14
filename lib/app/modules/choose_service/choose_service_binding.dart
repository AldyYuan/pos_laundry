import 'package:get/get.dart';
import 'package:pos_laundry/app/data/providers/api_provider.dart';
import 'package:pos_laundry/app/data/repositories/data_service_repository.dart';
import 'package:pos_laundry/app/modules/choose_service/choose_service_controller.dart';

class ChooseServiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseServiceController>(
      () => ChooseServiceController(
        DataServiceRepository(
          ApiProvider(),
        ),
      ),
    );
  }
}
