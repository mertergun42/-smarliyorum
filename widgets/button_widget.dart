import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final double? height;
  final double? fontSize;
  final BorderSide? side;
  final Widget? buttonIcon;
  final String? customFontFamily;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;

  const ButtonWidget(
      {Key? key,
      this.buttonText,
      this.buttonColor = Constants.secondBackgroundColor,
      this.textColor = Constants.buttonTextColor,
      this.customFontFamily = 'FontBold',
      this.fontWeight = FontWeight.w700,
      this.fontSize = 16,
      this.radius = 40,
      this.width = 318,
      this.height = 60,
      this.side = BorderSide.none,
      this.buttonIcon,
      required this.onPressed})
      : assert(onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!),
              side: side!,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (buttonIcon != null) ...[
              Padding(
                padding: EdgeInsets.all(Adaptive.w(5)),
                child: buttonIcon!,
              ),
            ],
            if (buttonIcon == null) ...[
              TextWidget(
                text: buttonText,
                color: textColor,
                fontFamily: customFontFamily,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
