import 'package:dio/dio.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/secret.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    try {} catch (e) {
      String? paymentIntentClientSecret = await _createPaymentIntent(10, "usd");

      if (paymentIntentClientSecret == null) {
        print('Payment failed: Failed to create payment intent');
        return;
      }

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Norman Samsudin',
      ));

      await _processPayment();

      print('Payment failed: $e');
      return;
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency
      };

      var response = await dio.post(
        '',
        data: data,
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          "Authorization": "Bearer $stripeSecretKey",
          "Content-Type": "application/x-www-form-urlencoded"
        }),
      );
      print('status ${response.statusCode}');

      if (response.data != null) {
        print(response.data);
        return response.data["client_secret"];
      }
      return "";
    } catch (e) {
      print('Payment failed: $e');
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print(e);
    }
  }

  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
