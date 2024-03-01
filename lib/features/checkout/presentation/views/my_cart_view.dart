import 'package:flutter/material.dart';

import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
      
    );
  }


}