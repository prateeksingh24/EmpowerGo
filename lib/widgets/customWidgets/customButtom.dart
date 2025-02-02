import 'package:empowergo/theme/appColor.dart';
import 'package:empowergo/widgets/customWidgets/customText.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  // final EdgeInsetsGeometry padding;
  // final EdgeInsetsGeometry margin;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor = Colors.white,
    this.width = 120,
    this.height = 30,
    this.radius,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed;
      },
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.gradientColors),
          border: Border.all(width: 0.58, color: Colors.white30),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          text: text,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
