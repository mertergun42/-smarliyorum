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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                              text: "Üye Ol",
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
                        padding: EdgeInsets.only(left: Adaptive.w(3)),
                        child: Row(
                          children: const [
                            TextWidget(
                              text:
                                  "Uygulamamıza kayıt olarak hızlı işlem\nyapabilirsiniz.",
                              color: Constants.mainTextColor,
                            ),
                          ],
                        ),
                      ),
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
                                  text: "Telefon",
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
                                hintText: "+90(---)  -- --",
                                keyboardType: TextInputType.phone,
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
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: Adaptive.w(3)),
                            child: Row(
                              children: const [
                                TextWidget(
                                  text: "Şifre Tekrar",
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
                            buttonText: "Kayıt Ol",
                            buttonColor: Constants.mainBackgroundColor,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            onPressed: () {
                              context
                                  .read<ViewBloc>()
                                  .add(ChangeView(state: VerificationState()));
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
                  padding: EdgeInsets.only(left: Adaptive.w(14)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/group.svg"),
                      SizedBox(
                        width: Adaptive.w(4),
                      ),
                      const TextWidget(
                        text: "Kvkk kullanıcı sözleşmesi.",
                        color: Constants.fourthTextColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(5),
                ),
                const TextWidget(
                  text: "Hemen giriş yap.",
                  color: Constants.fifthTextColor,
                ),
                SizedBox(
                  height: Adaptive.h(2),
                ),
                ButtonWidget(
                  buttonText: "Giriş Yap",
                  textColor: Constants.mainBackgroundColor,
                  buttonColor: Colors.white,
                  fontWeight: FontWeight.w700,
                  side: const BorderSide(
                      color: Constants.mainBackgroundColor, width: 2),
                  onPressed: () {
                    context.read<ViewBloc>().add(ChangeView(state: SignInState()));
                  },
                ),
                SizedBox(
                  height: Adaptive.h(2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      buttonIcon: SvgPicture.asset("assets/icons/icon-google.svg"),
                      width: Adaptive.w(37),
                      buttonColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFD1D1D1)),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: Adaptive.h(4),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
