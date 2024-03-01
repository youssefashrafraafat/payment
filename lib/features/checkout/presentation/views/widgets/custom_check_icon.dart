import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
          
          bottom: MediaQuery.sizeOf(context).height*0.8,
          left: 0,
          right: 0 ,
          top: -50,
          child:const CircleAvatar(
            radius: 50,
       backgroundColor:  Color.fromARGB(255, 240, 237, 237),
            child: CircleAvatar(backgroundColor: Color(0xff34A853),radius: 40,
            child: Icon(Icons.check,size: 50,color: Colors.white),),
            
            ),
        );
  }
}
