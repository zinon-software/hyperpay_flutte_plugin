import 'package:flutter_test/flutter_test.dart';
import 'package:hyperpay_flutte_plugin/hyperpay_flutte_plugin.dart';
import 'package:hyperpay_flutte_plugin/hyperpay_flutte_plugin_platform_interface.dart';
import 'package:hyperpay_flutte_plugin/hyperpay_flutte_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHyperpayFluttePluginPlatform
    with MockPlatformInterfaceMixin
    implements HyperpayFluttePluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<PaymentResultData> readyUICards({
    required List<String> brands,
    required String checkoutId,
    required PaymentMode paymentMode,
    required PaymentLang lang,
    required String shopperResultUrl,
  }) {
    // TODO: implement readyUICards
    throw UnimplementedError();
  }
}

void main() {
  final HyperpayFluttePluginPlatform initialPlatform =
      HyperpayFluttePluginPlatform.instance;

  test('$MethodChannelHyperpayFluttePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHyperpayFluttePlugin>());
  });

  test('getPlatformVersion', () async {
    HyperpayFluttePlugin hyperpayFluttePlugin = HyperpayFluttePlugin(
      shopperResultUrl: '',
      paymentMode: PaymentMode.test,
      lang: PaymentLang.ar,
    );
    
    MockHyperpayFluttePluginPlatform fakePlatform =
        MockHyperpayFluttePluginPlatform();
    HyperpayFluttePluginPlatform.instance = fakePlatform;

    expect(await hyperpayFluttePlugin.getPlatformVersion(), '42');
  });
}
