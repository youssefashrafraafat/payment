import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/features/checkout/data/models/amount_model/details.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';

import 'package:payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_list_view.dart';

class PaymentMethodBottomSheet extends StatefulWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  State<PaymentMethodBottomSheet> createState() => _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
    bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
           PaymentMethodListView(updatePaymentMethod: updatePaymentMethod,),
          const SizedBox(
            height: 32,
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const ThankYou();
                }));
              }
              if (state is PaymentFailure) {
                Navigator.pop(context);
                SnackBar snackBar = SnackBar(content: Text(state.errMessage));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is PaymentLoading ? true : false,
                text: 'Payment',
                onPressed: () {
                  if(isPaypal){

                    var getDataItem = getData();
 paypalNavigator(context, getDataItem);
                  }
                  else{
                   PaymentIntentInputModel paymentIntentInputModel=PaymentIntentInputModel(amount: '100', currency: 'usd',customerId: 'cus_P991MjK3niCbZ9');
                  BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  void paypalNavigator(BuildContext context, ({AmountModel amount, ItemListModel itemList}) getDataItem) {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "AbJkRLMVfJ62_dd7_Gjcruhv1DNxkXkR0hhFJ9dHvrxAeO4_s3MFZ-AS_AH2m5VmENSCLcx1baDi044x",
        secretKey:
            "EDGzgO4oTPkQRrDzcPmADqjYOZtj9E2ktQ4ntG2-Iz2JzDijE7MSoxtGm0FoRWW93YTbWQbs5dDOwczc",
        transactions: [
          {
            "amount": getDataItem.amount.toJson(),
            "description": "The payment transaction description.",
          
            "item_list": getDataItem.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getData() {
    var amount = AmountModel(
    total: "100",
      currency: 'USD',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'),
    );
    List<Item> orders = [
      Item( currency: 'USD',
      name: 'Apple',
      price: "4",
      quantity: 10,),
      Item(currency: 'USD',
      name: 'Apple',
      price: "5",
      quantity: 12,),
    ];
    var itemList = ItemListModel(items: orders);
    return (amount: amount, itemList: itemList);
  }
}
