import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hyperpay_flutte_plugin/hyperpay_flutte_plugin.dart';

import '../../helper.dart';
import '../../hyperpay_flutte_plugin_platform_interface.dart';

/// An implementation of [HyperpayFluttePluginPlatform] that uses method channels.
class MethodChannelReadyUI extends HyperpayFluttePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(PaymentConst.channelName);

  @override
  Future<PaymentResultData> readyUICards({required List<String> brands, required String checkoutId,
      required PaymentMode paymentMode, required PaymentLang lang, required String shopperResultUrl,}) async {
    String transactionStatus;

    try {
      final String? result = await methodChannel.invokeMethod(
        PaymentConst.methodCall,
        {
          "type": PaymentConst.readyUi,
          "mode": paymentMode.value,
          "checkoutid": checkoutId,
          "ShopperResultUrl": shopperResultUrl,
          "lang": lang.getLanguageCode(),
          "brand": brands,
        },
      );
      transactionStatus = '$result';
      return PaymentResultManger.getPaymentResult(transactionStatus);
    } on PlatformException catch (e) {
      transactionStatus = "${e.message}";
      return PaymentResultData(
          errorString: e.message, paymentResult: PaymentResult.error);
    }
  }
}
