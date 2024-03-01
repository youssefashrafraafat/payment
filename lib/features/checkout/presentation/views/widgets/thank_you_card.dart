import 'package:flutter/material.dart';

import 'package:payment/core/utls/styles.dart';
import 'package:payment/features/checkout/presentation/views/widgets/card_info_widget.dart';

import 'package:payment/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var date=DateTime.now().toString();
    var parse=DateTime.parse(date);
    var format ="${parse.day}/${parse.month}/${parse.year}";
    var formatTime ="${parse.hour}:${parse.minute}";
    return Container(
      decoration: ShapeDecoration(
        color:const Color.fromARGB(255, 240, 237, 237),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, right: 23, left: 23),
        child: Column(
          children: [
            const Text('Thank you!',
                textAlign: TextAlign.center, style: Styles.style25),
            const SizedBox(
              height: 2,
            ),
            Text('Your transaction was successful',
                textAlign: TextAlign.center, style: Styles.style20),
            const SizedBox(
              height: 42,
            ),
            PaymentItemInfo(hint: 'Date', price: format),
            const SizedBox(
              height: 20,
            ),
            
            PaymentItemInfo(hint: 'Time', price: formatTime),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(hint: 'To', price: 'Sam Louis'),
            const Divider(
              thickness: 2.5,
              height: 60,
              color: Color(0xFFC6C6C6),
            ),
            const TotalPrice(hint: 'Total', price: r'$50.97'),
            const SizedBox(height: 30,),
          const  CardInfoWidget(),
         const SizedBox(height: 87,),
           Row(
            children: [
              
              Image.asset('assets/images/SVGRepo_iconCarrier.png'),
              const SizedBox(width: 50,),
              Container(
    width: 113,
    height: 58,
    decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            side:const BorderSide(width: 1.50, color: Color(0xFF34A853)),
            borderRadius: BorderRadius.circular(15),
        ),
    ),
    child:const Center(
      child:  Text(
      'PAID',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color(0xFF34A853),
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 0,
      ),
    ),
    ),
)
            ],
          )
          ],
        ),
      ),
    );
  }
}

