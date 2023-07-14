import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? icon;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final bool? obscureText;

  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.width = 318,
    this.height = 54,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (icon == null) ...[
          SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: keyboardType,
                  obscureText: obscureText!,
                  style: const TextStyle(
                    fontFamily: "FontRegular",
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                        fontFamily: "FontRegular",
                        fontSize: 14,
                        color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    contentPadding: EdgeInsets.only(
                      left: Adaptive.w(7),
                      right: Adaptive.w(7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        if (icon != null) ...[
          SizedBox(
            width: width,
            height: height,
            child: TextFormField(
              keyboardType: keyboardType,
              obscureText: obscureText!,
              style: const TextStyle(
                fontFamily: "FontRegular",
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontFamily: "FontRegular",
                    fontSize: 14,
                    color: Colors.black),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      left: Adaptive.w(5), right: Adaptive.w(5)),
                  child: icon,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
                  borderRadius: BorderRadius.circular(40),
                ),
                contentPadding: EdgeInsets.only(
                  left: Adaptive.w(7),
                  right: Adaptive.w(7),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
