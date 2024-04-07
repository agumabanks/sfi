import 'dart:async';
import 'package:Sanaa/util/color_resources.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:Sanaa/features/auth/controllers/auth_controller.dart';
import 'package:Sanaa/features/splash/controllers/splash_controller.dart';
import 'package:Sanaa/features/transaction_money/controllers/contact_controller.dart';
import 'package:Sanaa/data/api/api_checker.dart';
import 'package:Sanaa/features/auth/domain/models/user_short_data_model.dart';
import 'package:Sanaa/helper/route_helper.dart';
import 'package:Sanaa/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sanaa/helper/custom_snackbar_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();

    _onConnectivityChanged = _connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (await ApiChecker.isVpnActive()) {
        showCustomSnackBarHelper('you are using vpn',
            isVpn: true, duration: const Duration(minutes: 10));
      }
      await _route();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }

  Future<void> _route() async {
    await Get.find<ContactController>().getContactList().then((_) {
      Get.find<SplashController>().getConfigData().then((value) {
        if (value.isOk) {
          Timer(const Duration(seconds: 1), () async {
            Get.find<SplashController>().initSharedData().then((value) {
              UserShortDataModel? userData =
                  Get.find<AuthController>().getUserData();

              if (userData != null &&
                  (Get.find<SplashController>().configModel!.companyName !=
                      null)) {
                Get.offNamed(RouteHelper.getLoginRoute(
                  countryCode: userData.countryCode,
                  phoneNumber: userData.phone,
                ));
              } else {
                Get.offNamed(RouteHelper.getChoseLoginRegRoute());
              }
            });
          });
        }
      });
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
        //  Positioned(
        //     bottom: 10,
        //     right:Get.width /2 -30,left: 0,
        //     child: // Adjust spacing between logo and company name
        //         Text(
        //           'SANNAA FINANCE',
        //           style: TextStyle(
        //             fontSize: 20,
        //             fontWeight: FontWeight.w800,
        //             color: ColorResources.getSplashTextColor(),
        //           ),
        //         ),
          
        //   ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Images.logo,
                    height:
                        175), // Adjust asset path as per your project structure
               
              ],
            ),
          ),

          
        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Image.asset(Images.logo, height: 175),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
