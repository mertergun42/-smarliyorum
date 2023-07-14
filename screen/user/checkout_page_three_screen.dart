import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/navigation_top_bar_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutPageThreeScreen extends StatelessWidget {
  const CheckoutPageThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(100),
      height: Adaptive.h(100),
      color: Constants.mainBackgroundColor,
      child: Column(
        children: [
          const NavigationTopBarWidget(
            screenName: "Hediye Kartı",
            color: Colors.white,
          ),
          SizedBox(
            height: Adaptive.h(4),
          ),
          Container(
            width: Adaptive.w(90),
            height: Adaptive.h(64),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: Adaptive.w(10), top: Adaptive.h(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/following.svg"),
                          SizedBox(
                            width: Adaptive.w(3),
                          ),
                          TextWidget(
                            text: "Ismarlanan Kişi",
                            color: Colors.black.withOpacity(0.49),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(0.5),
                      ),
                      const TextWidget(
                        text: "Efe Semih Demirtaş",
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      const TextWidget(
                        text: "+90(539) 488 34 41",
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      SizedBox(
                        height: Adaptive.h(3),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/qr.png",
                        width: Adaptive.w(35),
                      ),
                      SizedBox(
                        height: Adaptive.h(3),
                      ),
                      const TextWidget(
                        text: "Lütfen Qr Kodu Taratınız",
                        color: Color(0xFF2F2F2F),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                      SizedBox(
                        height: Adaptive.h(1),
                      ),
                      SizedBox(
                        width: Adaptive.w(75),
                        child: const TextWidget(
                          text:
                              "Üründen faydalanmak için işletme hesabının qr kod ekranını okutmanız gerekmektedir.",
                          color: Colors.black,
                          fontSize: 13,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Adaptive.h(4),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: Adaptive.w(34),
                height: Adaptive.h(7),
                decoration: BoxDecoration(
                  color: Constants.secondBackgroundColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/load-circle.svg"),
                    SizedBox(
                      width: Adaptive.w(2),
                    ),
                    const TextWidget(
                      text: "İndir",
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
              Container(
                width: Adaptive.w(34),
                height: Adaptive.h(7),
                decoration: BoxDecoration(
                  color: Constants.mainBackgroundColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/whatsapp.png"),
                    SizedBox(
                      width: Adaptive.w(2),
                    ),
                    const TextWidget(
                      text: "Gönder",
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
              SvgPicture.asset("assets/icons/share.svg")
            ],
          ),
        ],
      ),
    );
  }
}
