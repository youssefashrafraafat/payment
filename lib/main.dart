import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utls/api_keys.dart';
import 'package:payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment/features/checkout/presentation/views/payment_details.dart';

void main() {
  Stripe.publishableKey=ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyCartView(),
      routes: {PaymentDetailsView.id: (context) => const PaymentDetailsView()},
    );
  }
}
