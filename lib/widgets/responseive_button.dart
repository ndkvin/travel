import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {

  final bool? isResponsive;
  final double? width;


  const ResponsiveButton({ Key? key, this.isResponsive = false, this.width = 120 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        child: Row(
          mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween :  MainAxisAlignment.center,
          children: [
            isResponsive == true ?  Container(margin: const EdgeInsets.only(left: 20),child: const AppText(text: 'Book Trip Now',color: Colors.white,)) : Container(),
            Image.asset('assets/images/button-one.png'),
          ],
        ),
      ),
    );
  }
}