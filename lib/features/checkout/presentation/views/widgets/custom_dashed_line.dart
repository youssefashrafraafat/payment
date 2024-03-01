import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(30, (index) => Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          color:const Color.fromARGB(255, 41, 40, 40),
          height: 1,
        ),
      ),
    )),);
  }
}

