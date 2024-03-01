import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';

import 'package:payment/features/checkout/presentation/views/widgets/custom_credit_cart.dart';

import 'package:payment/features/checkout/presentation/views/widgets/payment_method_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
   final  GlobalKey<FormState> formKey = GlobalKey();
     AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {

    return  CustomScrollView(
      physics:const BouncingScrollPhysics(),
     slivers: [
    //  const  SliverToBoxAdapter(child: PaymentMethodListView()), 
        SliverToBoxAdapter(child: CustomCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,)),
        
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12,left: 20,right: 20),
              child: CustomButton(
                text: 'Pay',
                
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const ThankYou();
                    },));
autovalidateMode=AutovalidateMode.always;
setState(() {
  
});
                  }
                
              },),
            ),
          ),
        )
        ],
      );
    
  }
}

