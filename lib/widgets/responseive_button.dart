import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {

  final bool? isResponsive;
  final double? width;


  const ResponsiveButton({ Key? key, this.isResponsive = false, this.width }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      width: width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/button-one.png'),

        ],
      ),
    );
  }
}