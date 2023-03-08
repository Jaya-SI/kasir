import 'package:flutter/material.dart';
import 'package:kasir/model/auth/auth_model.dart';
import 'package:kasir/pages/navigation/home/home_page.dart';
import 'package:kasir/repositories/transaction/transaction_repository.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../widget/header_dashboard.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({this.auth, super.key});
  AuthModel? auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              HeaderDashboard(auth: auth),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      context.loaderOverlay.show();
                      TransactionRepository()
                          .createTransaksi()
                          .then((value) => {
                                if (value.meta!.code == 200)
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          transaksi: value.data,
                                          auth: auth,
                                        ),
                                      ),
                                    )
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(value.meta!.message!),
                                    ))
                                  }
                              });
                    },
                    child: Container(
                      width: 40.w,
                      height: 30.w,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/transaksi.png',
                            width: 10.w,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Transaksi Baru',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff252E4E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    height: 30.w,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/barcode.png',
                          color: Colors.black,
                          width: 10.w,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Scan QR Code',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff252E4E),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40.w,
                      height: 30.w,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/history.png',
                            width: 10.w,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'History Transaksi',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff252E4E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    height: 30.w,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/absen.png',
                          width: 10.w,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'History Absen',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff252E4E),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}