import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sanaa/common/widgets/custom_dialog_widget.dart';
import 'package:Sanaa/features/setting/controllers/profile_screen_controller.dart';
import 'package:Sanaa/helper/dialog_helper.dart';
import 'package:Sanaa/util/app_constants.dart';
import 'package:Sanaa/common/widgets/custom_loader_widget.dart';
import 'package:Sanaa/features/home/screens/nav_bar_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebScreen extends StatefulWidget {
  final String selectedUrl;
  final bool? isPaymentUrl;
  const WebScreen({Key? key, required this.selectedUrl, this.isPaymentUrl = false}) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  double value = 0.0;
  late WebViewController controllerGlobal;

  PullToRefreshController? pullToRefreshController;
  late MyInAppBrowser browser;


  @override
  void initState() {
    super.initState();
    _initData();

  }

  void _initData() async {
    browser = MyInAppBrowser(widget.isPaymentUrl!);
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

      bool swAvailable = await AndroidWebViewFeature.isFeatureSupported(AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      bool swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

      if (swAvailable && swInterceptAvailable) {
        AndroidServiceWorkerController serviceWorkerController = AndroidServiceWorkerController.instance();
        await serviceWorkerController.setServiceWorkerClient(AndroidServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            return null;
          },
        ));
      }
    }

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.black,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          browser.webViewController.reload();
        } else if (Platform.isIOS) {
          browser.webViewController.loadUrl(urlRequest: URLRequest(url: await browser.webViewController.getUrl()));
        }
      },
    );
    browser.pullToRefreshController = pullToRefreshController;

    await browser.openUrlRequest(
      urlRequest: URLRequest(url: Uri.parse(widget.selectedUrl)),
      options: InAppBrowserClassOptions(
        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(useShouldOverrideUrlLoading: false, useOnLoadResource: false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
             Center(
              child: CustomLoaderWidget(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }

}


class MyInAppBrowser extends InAppBrowser {
  final bool isPaymentUrl;

  bool _canRedirect = true;

  MyInAppBrowser(this.isPaymentUrl);

  @override
  Future onBrowserCreated() async {
    debugPrint("\n\nBrowser Created!\n\n");

  }

  @override
  Future onLoadStart(url) async {
    debugPrint("\n\nStarted: $url\n\n");

    _pageRedirect(url.toString());
  }

  @override
  Future onLoadStop(url) async {
    pullToRefreshController?.endRefreshing();
    debugPrint("\n\nStopped: $url\n\n");

    _pageRedirect(url.toString());
  }

  @override
  void onLoadError(url, code, message) {
    pullToRefreshController?.endRefreshing();
    debugPrint("Can't load [$url] Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    if (progress == 100) {
      pullToRefreshController?.endRefreshing();
    }

    debugPrint("Progress: $progress");

  }

  @override
  void onExit() {
    if(_canRedirect) {
      Navigator.of(Get.context!).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const NavBarScreen()), (route) => false);

    }

    debugPrint("\n\nBrowser closed!\n\n");

  }

  @override
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(navigationAction) async {
    debugPrint("\n\nOverride ${navigationAction.request.url}\n\n");

    return NavigationActionPolicy.ALLOW;
  }

  @override
  void onLoadResource(resource) {
    // print("Started at: " + response.startTime.toString() + "ms ---> duration: " + response.duration.toString() + "ms " + (response.url ?? '').toString());
  }

  @override
  void onConsoleMessage(consoleMessage) {
    debugPrint("""
    console output:
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel.toValue()}
   """);
  }

  void _pageRedirect(String url) {
    
    
    
    
    
    if(_canRedirect && isPaymentUrl) {

      if(url.contains(AppConstants.baseUrl) && url.contains('token')) {
        bool isSuccess = url.contains('success');
        bool isFailed = url.contains('fail');


        if(isSuccess || isFailed) {
          _canRedirect = false;
          close();
        }


        if (isSuccess) {
          Get.offAll(const NavBarScreen());
          Get.find<ProfileController>().getProfileData(reload:true);

          DialogHelper.showAnimatedDialog(Get.context!, CustomDialogWidget(
            icon: Icons.done,
            title: 'add_money'.tr,
            description: 'your_money_added_successfully'.tr,
            isSingleButton: true,
          ), dismissible: false, isFlip: true);

        }

        } else{

        Get.offAll(const NavBarScreen());

        DialogHelper.showAnimatedDialog(Get.context!, CustomDialogWidget(
          icon: Icons.clear,
          title: 'add_money'.tr,
          description: 'your_payment_failed'.tr,
          isFailed: true,
          isSingleButton: true,
        ), dismissible: false, isFlip: true);
      }
    }
  }

}
