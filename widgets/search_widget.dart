import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(90),
      height: Adaptive.h(7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAEAEA), width: 1.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: Adaptive.w(3), right: Adaptive.w(3)),
        child: TextFormField(
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontFamily: "FontRegular"),
          decoration: InputDecoration(
              hintText: "Uygulama içi arama...",
              hintStyle: const TextStyle(
                  color: Color(0xFF797979),
                  fontSize: 16,
                  fontFamily: "FontRegular"),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              suffixIcon: Padding(
                padding:
                    EdgeInsets.only(left: Adaptive.w(3), right: Adaptive.w(3)),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                ),
              )),
        ),
      ),
    );
  }
}
