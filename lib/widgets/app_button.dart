import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_text.dart';

class AppButton extends StatelessWidget {

  final Color color;
  final Color backgroudColor;
  double size;
  String? text;
  IconData? icon;
  final bool isIcon;
  final Color borderColor;

  AppButton({ 
    Key? key,
    this.text = 'HI',
    this.icon,
    required this.isIcon,
    required this.color,
    required this.backgroudColor,
    required this.size, 
    required this.borderColor
  }) : super(key: key);

  Widget child() {
    if (!isIcon) {
      return Center(
        child: AppText(
          text: text!,
          color: color
        ),
      );
    } else {
      return Center(
        child: Icon(
          icon,
          color: color,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroudColor,
      ),
      child: child(),
    );
  }
}
