import 'package:flutter/material.dart';
import 'package:payment/core/utls/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text,  this.isLoading=false});
  final String text;
  final bool isLoading;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        fixedSize:const Size(350, 60),
        backgroundColor: const Color(0xFF34A853),
        shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.circular(15)
        )
      ),
      
      onPressed: onPressed, child:isLoading?const CircularProgressIndicator():Text(
    text,
    textAlign: TextAlign.center,
    style:Styles.style22,
));
  }
}