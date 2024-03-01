import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(onTap: () {
        Navigator.pop(context);
      },),
      body:Transform.translate(
        offset:const Offset(0, -15),
        child: const ThankYouViewBody()),
    );
  }
}