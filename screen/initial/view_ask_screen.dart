import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/button_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewAskScreen extends StatelessWidget {
  const ViewAskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(100),
      height: Adaptive.h(100),
      color: Constants.mainBackgroundColor,
      child: Column(
        children: [
          AnimatedCard(
            direction: AnimatedCardDirection.top,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: Adaptive.h(16),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Adaptive.w(12)),
                    child: SvgPicture.asset(
                      "assets/icons/main-logo.svg",
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Adaptive.h(6),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.left,
            child: Center(
              child: SizedBox(
                width: Adaptive.w(70),
                child: const TextWidget(
                  text: "Fashion Style Trend Center For Women",
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Adaptive.h(4),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: Center(
              child: SizedBox(
                width: Adaptive.w(70),
                child: const TextWidget(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Adaptive.h(5),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.bottom,
            child: Center(
              child: Column(
                children: [
                  ButtonWidget(
                    buttonText: "Giriş Yap",
                    onPressed: () {
                      context
                          .read<ViewBloc>()
                          .add(ChangeView(state: SignInState()));
                    },
                  ),
                  SizedBox(
                    height: Adaptive.h(2),
                  ),
                  ButtonWidget(
                    buttonText: "Üye Ol",
                    onPressed: () {
                      context
                          .read<ViewBloc>()
                          .add(ChangeView(state: SignUpState()));
                    },
                  ),
                  SizedBox(
                    height: Adaptive.h(2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        buttonIcon:
                            SvgPicture.asset("assets/icons/icon-google.svg"),
                        width: Adaptive.w(37),
                        buttonColor: Colors.white,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: Adaptive.w(6),
                      ),
                      ButtonWidget(
                        buttonIcon:
                            SvgPicture.asset("assets/icons/icon-facebook.svg"),
                        width: Adaptive.w(37),
                        buttonColor: Constants.facebookButtonColor,
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
