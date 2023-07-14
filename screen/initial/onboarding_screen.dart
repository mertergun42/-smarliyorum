import 'package:animated_card/animated_card.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/widgets/button_widget.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  List images = [
    'assets/images/onboarding.png',
    'assets/images/onboarding.png',
    'assets/images/onboarding.png',
  ];

  List textTitle = [
    "Best Collections in Summer Sale",
    "Best Collections in Summer Sale",
    "Best Collections in Summer Sale",
  ];
  List text = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor adipiscing elit, sed do eiusmod tem",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor adipiscing elit, sed do eiusmod tem",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor adipiscing elit, sed do eiusmod tem",
  ];

  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Center(
        child: SizedBox(
          width: Adaptive.w(100),
          height: Adaptive.h(100),
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: Adaptive.h(12),
                  ),
                  SvgPicture.asset("assets/icons/logo.svg"),
                  SizedBox(
                    height: Adaptive.h(8),
                  ),
                  Image.asset(
                    images[index],
                    width: Adaptive.w(44),
                  ),
                  SizedBox(
                    height: Adaptive.h(8),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Adaptive.w(20), right: Adaptive.w(20)),
                    child: TextWidget(
                      text: textTitle[index],
                      fontFamily: "FontBold",
                      fontSize: 24,
                      color: Color(0xFF0F0F0F),
                      fontWeight: FontWeight.w900,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: Adaptive.h(5),
                  ),
                  SizedBox(
                    width: Adaptive.w(60),
                    child: TextWidget(
                      text: text[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: Adaptive.h(12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                              duration: _kDuration, curve: _kCurve);
                        },
                        child: SizedBox(
                            width: Adaptive.w(40),
                            child: SvgPicture.asset("assets/icons/back-arrow.svg")),
                      ),
                      for (var i = 0; i < images.length; i++)
                        buildIndicator(currentIndex == i),
                      GestureDetector(
                          onTap: () {
                            if (currentIndex == 2) {
                              context
                                  .read<ViewBloc>()
                                  .add(ChangeView(state: ViewAskState()));
                            } else {
                              _controller.nextPage(
                                  duration: _kDuration, curve: _kCurve);
                            }
                          },
                          child: SizedBox(
                              width: Adaptive.w(40),
                              child:
                                  SvgPicture.asset("assets/icons/next-arrow.svg"))),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: EdgeInsets.only(left: Adaptive.w(2), right: Adaptive.w(2)),
      child: Row(
        children: [
          Container(
            height: isSelected ? Adaptive.h(0.7) : Adaptive.h(0.7),
            width: isSelected ? Adaptive.w(1.4) : Adaptive.w(1.4),
            decoration: BoxDecoration(
              borderRadius: isSelected
                  ? BorderRadius.circular(5)
                  : BorderRadius.circular(100),
              color: isSelected
                  ? Constants.mainBackgroundColor
                  : Color(0xFF030303).withOpacity(0.21),
            ),
          ),
        ],
      ),
    );
  }
}
