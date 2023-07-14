import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/button_widget.dart';
import 'package:ismarliyorum/widgets/text_form_field_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: Adaptive.h(10),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.top,
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/logo.svg",
                width: Adaptive.w(60),
              ),
            ),
          ),
          SizedBox(
            height: Adaptive.h(4),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.bottom,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: Adaptive.w(85),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Adaptive.w(3)),
                          child: Row(
                            children: const [
                              TextWidget(
                                text: "Giriş Yap",
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Constants.secondTextColor,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(1.5),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Adaptive.w(3), right: Adaptive.w(3)),
                            child: SizedBox(
                              width: Adaptive.w(85),
                              child: const TextWidget(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                                color: Constants.mainTextColor,
                              ),
                            )),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Adaptive.w(3)),
                              child: Row(
                                children: const [
                                  TextWidget(
                                    text: "Adınız, Soyadınız",
                                    color: Constants.labelTextColor,
                                    fontSize: 16,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Adaptive.h(1.5),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                TextFormFieldWidget(
                                  hintText: "Efe Semih DEMİRTAŞ",
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: Adaptive.h(2),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Adaptive.w(3)),
                              child: Row(
                                children: const [
                                  TextWidget(
                                    text: "Şifre",
                                    color: Constants.labelTextColor,
                                    fontSize: 16,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Adaptive.h(1.5),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                TextFormFieldWidget(
                                  hintText: "*******",
                                  obscureText: true,
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Constants.buttonTextColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: Adaptive.h(2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonWidget(
                              buttonText: "Giriş Yap",
                              buttonColor: Constants.mainBackgroundColor,
                              textColor: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              onPressed: () {
                                context
                                    .read<ViewBloc>()
                                    .add(ChangeView(state: UserMainState()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Adaptive.h(2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Adaptive.w(12)),
                    child: Row(
                      children: const [
                        TextWidget(
                          text: "Şifremi Unuttum",
                          color: Constants.fourthTextColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Adaptive.h(8),
                  ),
                  const TextWidget(
                    text: "Üye Değilsen Hemen Kayıt Ol.",
                    color: Constants.fifthTextColor,
                  ),
                  SizedBox(
                    height: Adaptive.h(2),
                  ),
                  ButtonWidget(
                    buttonText: "Kayıt Ol",
                    textColor: Constants.mainBackgroundColor,
                    buttonColor: Colors.white,
                    fontWeight: FontWeight.w700,
                    side: const BorderSide(
                        color: Constants.mainBackgroundColor, width: 2),
                    onPressed: () {
                      context
                          .read<ViewBloc>()
                          .add(ChangeView(state: SignUpState()));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
