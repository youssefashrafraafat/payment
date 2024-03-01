  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utls/styles.dart';

AppBar customAppBar({String? title,Function()? onTap}) {
    return AppBar(
      centerTitle: true,
      leading: Center(child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset('assets/images/Arrow.svg'))),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title:Text(
 title??'' ,
  textAlign: TextAlign.center,
  style: Styles.style25
),
    );
  }