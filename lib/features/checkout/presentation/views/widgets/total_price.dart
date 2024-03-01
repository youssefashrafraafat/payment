import 'package:flutter/material.dart';
import 'package:payment/core/utls/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.hint, required this.price});
final String hint,price;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
    hint,
    textAlign: TextAlign.center,
    style: Styles.style24,

),
const Spacer(),
Text(
    price,
    textAlign: TextAlign.center,
    style: Styles.style24,
)
      ],
    );
  }
}