import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key, required this.updatePaymentMethod});
 final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
final List<String>paymentMethodItem=const['assets/images/cart.svg','assets/images/paypal.svg'];

  int isactive=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodItem.length,
        itemBuilder: (context,index){
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: (){
            isactive=index;
           
            setState(() {
              widget.updatePaymentMethod(index: isactive);
            });
          },
          child: PaymentMethodItem(isactive: isactive==index, image: paymentMethodItem[index])),
      );
      }),
    );
  }
}