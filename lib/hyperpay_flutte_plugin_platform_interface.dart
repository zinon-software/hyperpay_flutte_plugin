import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hyperpay_flutte_plugin.dart';
import 'hyperpay_flutte_plugin_method_channel.dart';

abstract class HyperpayFluttePluginPlatform extends PlatformInterface {
  /// Constructs a HyperpayFluttePluginPlatform.
  HyperpayFluttePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static HyperpayFluttePluginPlatform _instance =
      MethodChannelHyperpayFluttePlugin();

  /// The default instance of [HyperpayFluttePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelHyperpayFluttePlugin].
  static HyperpayFluttePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HyperpayFluttePluginPlatform] when
  /// they register themselves.
  static set instance(HyperpayFluttePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<PaymentResultData> readyUICards({
    required List<String> brands,
    required String checkoutId,
    required PaymentMode paymentMode,
    required PaymentLang lang,
    required String shopperResultUrl,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
