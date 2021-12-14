import 'package:flutter/material.dart';
import 'package:pos_laundry/app/modules/choose_service/local_widgets/list_data_services.dart';

import 'local_widgets/search_form.dart';

class ChooseServicePage extends StatelessWidget {
  const ChooseServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Layanan"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              // Form untuk mencari data layanan
              SearchForm(),
              SizedBox(height: 16.0),

              // List data layanan
              ListDataServices(),
            ],
          ),
        ),
      ),
    );
  }
}
