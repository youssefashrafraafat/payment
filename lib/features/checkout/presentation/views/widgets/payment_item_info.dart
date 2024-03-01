import 'package:flutter/material.dart';
import 'package:payment/core/utls/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.hint, required this.price});
final String hint,price;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
Text(
    hint,
    textAlign: TextAlign.center,
    style: Styles.style18,
),
const Spacer(),
Text(
    price,
    textAlign: TextAlign.center,
    style: Styles.style18.copyWith(fontWeight: FontWeight.w600),

),


      ],
    );
  }
}