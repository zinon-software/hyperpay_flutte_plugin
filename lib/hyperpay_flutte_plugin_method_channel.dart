import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hyperpay_flutte_plugin.dart';
import 'hyperpay_flutte_plugin_platform_interface.dart';

/// An implementation of [HyperpayFluttePluginPlatform] that uses method channels.
class MethodChannelHyperpayFluttePlugin extends HyperpayFluttePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(PaymentConst.channelName);

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
