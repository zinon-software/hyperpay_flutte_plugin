package com.zainon.hyperpay_flutte_plugin;

import androidx.annotation.NonNull;

import android.content.Context;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** HyperpayFluttePlugin */
public class HyperpayFluttePlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native
  /// Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine
  /// and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private String CHANNEL = "hyperpay_flutte_plugin/channel";

  private Context context;

  private String mode = "";
  private String ShopperResultUrl = "";

  private String number, holder, cvv, year, month, brand;
  private List<String> brandsReadyUi;
  private String Lang = "ar_AR";

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if ("gethyperpayresponse") {
      // result.success("gethyperpayresponse");
      String type = call.argument("type");
      mode = call.argument("mode");
      String checkoutId = call.argument("checkoutid");
      Lang = call.argument("lang");
      ShopperResultUrl = call.argument("ShopperResultUrl");

      switch (type != null ? type : "NullType") {
        case "ReadyUI":
          brandsReadyUi = call.argument("brand");
          // setStorePaymentDetailsMode = call.argument("setStorePaymentDetailsMode");
          // openCheckoutUI(checkoutId);
          break;

        // case "StoredCards":
        // cvv = call.argument("cvv");
        // TokenID = call.argument("TokenID");
        // storedCardPayment(checkoutId);
        // break;

        // case "CustomUI":
        // brands = call.argument("brand");
        // number = call.argument("card_number");
        // holder = call.argument("holder_name");
        // year = call.argument("year");
        // month = call.argument("month");
        // cvv = call.argument("cvv");
        // EnabledTokenization = call.argument("EnabledTokenization");
        // openCustomUI(checkoutId);
        // break;

        // case "CustomUISTC":
        // number = call.argument("phone_number");
        // openCustomUISTC(checkoutId);

        default:
          error("1", "THIS TYPE NO IMPLEMENT" + type, "");
      }

    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
