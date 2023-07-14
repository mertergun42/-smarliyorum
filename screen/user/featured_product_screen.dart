import 'package:flutter/material.dart';
import 'package:ismarliyorum/widgets/navigation_top_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeaturedProductScreen extends StatelessWidget {
  const FeaturedProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavigationTopBarWidget(screenName: "Kampanyalar"),
        SizedBox(
          height: Adaptive.h(4),
        ),
        SizedBox(
          width: Adaptive.w(90),
          height: Adaptive.h(24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/campaign-one.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: Adaptive.h(3),
        ),
        SizedBox(
          width: Adaptive.w(90),
          height: Adaptive.h(24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/campaign-two.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: Adaptive.h(3),
        ),
        SizedBox(
          width: Adaptive.w(90),
          height: Adaptive.h(24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/campaign-three.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: Adaptive.h(4),
        ),
      ],
    );
  }
}
