import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/button_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _onEditing = true;
  String? code;

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
              "assets/icons/main-logo.svg",
              color: Constants.mainBackgroundColor,
            ),
          ),
        ),
        SizedBox(
          height: Adaptive.h(6),
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
                      Row(
                        children: const [
                          TextWidget(
                            text: "Kodu Giriniz",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Constants.secondTextColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(1.5),
                      ),
                      Row(
                        children: const [
                          TextWidget(
                            text: "Telefon numaranıza gelen kodu giriniz.",
                            color: Constants.mainTextColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(8),
                      ),
                      SizedBox(
                        width: Adaptive.w(86),
                        height: Adaptive.h(7),
                        child: Center(
                          child: VerificationCode(
                            fullBorder: true,
                            fillColor: Colors.white,
                            isSecure: true,
                            textStyle: const TextStyle(
                                color: Constants.mainTextColor,
                                fontFamily: "NunitoBold",
                                fontSize: 14),
                            keyboardType: TextInputType.number,
                            underlineColor:
                                Constants.mainTextColor.withOpacity(0.6),
                            underlineUnfocusedColor:
                                Constants.mainTextColor.withOpacity(0.2),
                            length: 4,
                            cursorColor: Constants.mainTextColor,
                            margin: EdgeInsets.only(
                              left: Adaptive.w(3),
                              right: Adaptive.w(3),
                            ),
                            onCompleted: (String value) {
                              setState(() {
                                code = value;
                              });
                            },
                            onEditing: (bool value) {
                              setState(() {
                                _onEditing = value;
                              });
                              if (!_onEditing) FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Adaptive.h(8),
                      ),
                      ButtonWidget(
                        buttonText: "Onayla",
                        buttonColor: Constants.mainBackgroundColor,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        onPressed: () {
                          try {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: Adaptive.h(70),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/main-logo.svg",
                                          color: Constants.mainBackgroundColor,
                                        ),
                                        SizedBox(
                                          height: Adaptive.h(10),
                                        ),
                                        Image.asset(
                                          "assets/images/like.png",
                                          width: Adaptive.w(30),
                                        ),
                                        SizedBox(
                                          height: Adaptive.h(6),
                                        ),
                                        const TextWidget(
                                          text:
                                              "Tebrikler\nİşleminiz Başarıyla Gerçekleşti.",
                                          textAlign: TextAlign.center,
                                          fontSize: 24,
                                          fontFamily: "FontBold",
                                          color: Constants.sixthTextColor,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );

                            context
                                .read<ViewBloc>()
                                .add(ChangeView(state: SignInState()));
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: Adaptive.h(70),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/main-logo.svg",
                                          color: Constants.mainBackgroundColor,
                                        ),
                                        SizedBox(
                                          height: Adaptive.h(10),
                                        ),
                                        Image.asset(
                                          "assets/images/warning.png",
                                          width: Adaptive.w(30),
                                        ),
                                        SizedBox(
                                          height: Adaptive.h(6),
                                        ),
                                        const TextWidget(
                                          text:
                                              "Hay Aksi! İşlem Yaparken Bir Hata Oluştu.",
                                          textAlign: TextAlign.center,
                                          fontSize: 24,
                                          fontFamily: "FontBold",
                                          color: Constants.sixthTextColor,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(4),
                ),
                const TextWidget(
                  text: "Tekrar Gönder",
                  color: Constants.fourthTextColor,
                  fontSize: 16,
                ),
                SizedBox(
                  height: Adaptive.h(16),
                ),
                const TextWidget(
                  text: "Başka Yöntem Dene",
                  color: Constants.fifthTextColor,
                ),
                SizedBox(
                  height: Adaptive.h(3),
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
