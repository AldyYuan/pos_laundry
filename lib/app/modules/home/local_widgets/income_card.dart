import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_laundry/app/core/values/colors.dart';
import 'package:pos_laundry/app/core/values/strings.dart';

import '../home_controller.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController = Get.find<HomeController>();

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.local_laundry_service_rounded,
                  color: white,
                  size: 36,
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SvgPicture.asset(
                    profilePic,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Halo, Admin!",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 32.0),
            Obx(
              () => Text(
                NumberFormat.simpleCurrency(
                  locale: 'id_ID',
                  decimalDigits: 0,
                ).format(_homeController.income),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Total Pendapatan",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
