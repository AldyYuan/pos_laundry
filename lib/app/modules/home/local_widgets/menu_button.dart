import 'package:flutter/material.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          const SizedBox(width: 32.0),
          InkWell(
            onTap: () {},
            child: Container(
              width: 106,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 16,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.point_of_sale_rounded,
                      color: white,
                      size: 32,
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      "Buat Transaksi",
                      style: TextStyle(
                        color: white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          InkWell(
            onTap: () {},
            child: Container(
              width: 106,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.receipt_long_rounded,
                      color: primaryColor,
                      size: 32,
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      "Daftar Transaksi",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          const SizedBox(
            width: 66,
            child: Center(
              child: Icon(
                Icons.more_vert_rounded,
                color: black,
              ),
            ),
          ),
          const SizedBox(width: 32.0),
        ],
      ),
    );
  }
}
