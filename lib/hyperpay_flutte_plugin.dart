import 'dart:io';

import 'hyperpay_flutte_plugin_platform_interface.dart';

part 'hyper_pay_const.dart';

part 'enum.dart';

class HyperpayFluttePlugin {
  String shopperResultUrl = "";
  PaymentLang lang;
  PaymentMode paymentMode;

  HyperpayFluttePlugin({
    required this.shopperResultUrl,
    required this.paymentMode,
    required this.lang,
  });

  Future<String?> getPlatformVersion() {
    return HyperpayFluttePluginPlatform.instance.getPlatformVersion();
  }

  Future<PaymentResultData> readyUICards(
      {required List<String> brands, required String checkoutId}) {
    return HyperpayFluttePluginPlatform.instance.readyUICards(
      brands: [],
      checkoutId: checkoutId,
      paymentMode: paymentMode,
      lang: lang,
      shopperResultUrl: shopperResultUrl,
    );
  }

  // Future<PaymentResultData> getPlatformVersion() {
  //   return HyperpayFluttePluginPlatform.instance.getPlatformVersion();
  // }

  // Future<PaymentResultData> getPlatformVersion() {
  //   return HyperpayFluttePluginPlatform.instance.getPlatformVersion();
  // }
}
