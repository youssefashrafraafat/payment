import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});
static String id='paymentdetail';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: customAppBar(title: 'Payment Details',onTap: (){Navigator.pop(context);}),
body:const  PaymentDetailsViewBody(),
    );
  }
}