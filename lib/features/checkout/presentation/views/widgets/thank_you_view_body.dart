import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:payment/features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children:[ const ThankYouCard(),
          Positioned(
            left: 20+16,
            right: 20+16,
             bottom: MediaQuery.sizeOf(context).height*0.22,
            child:const CustomDashedLine(),
          ),
        Positioned(
          
          bottom: MediaQuery.sizeOf(context).height*0.2,
          left: -20,
          child:const CircleAvatar(backgroundColor: Colors.white,)),
          
              Positioned(
          
          bottom: MediaQuery.sizeOf(context).height*0.2,
          right: -20,
          child:const CircleAvatar(backgroundColor: Colors.white,)),
          
           const  CustomCheckIcon()
          
          ]
      ),
    );
  }
}


