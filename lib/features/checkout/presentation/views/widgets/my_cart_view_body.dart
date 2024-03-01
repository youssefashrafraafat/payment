import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo_imple.dart';
import 'package:payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';

import 'package:payment/features/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_buttom_sheet.dart';

import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/Group 6.png')),
          const SizedBox(
            height: 15,
          ),
          const OrderInfoItem(
            hint: 'Order Subtotal',
            price: r'$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            hint: 'Discount',
            price: r'$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            hint: 'Shipping',
            price: r'$8',
          ),
          const Divider(
            thickness: 2.5,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            hint: 'Total',
            price: '\$50.97',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Complete Payment',
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) {
                    return  BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
