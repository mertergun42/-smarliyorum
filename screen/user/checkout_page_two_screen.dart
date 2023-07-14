import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/button_widget.dart';
import 'package:ismarliyorum/widgets/navigation_top_bar_widget.dart';
import 'package:ismarliyorum/widgets/text_form_field_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutPageTwoScreen extends StatefulWidget {
  const CheckoutPageTwoScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutPageTwoScreen> createState() => _CheckoutPageTwoScreenState();
}

class _CheckoutPageTwoScreenState extends State<CheckoutPageTwoScreen> {
  String txt = '';
  var isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavigationTopBarWidget(screenName: "Ödeme Yap"),
        SizedBox(
          height: Adaptive.h(4),
        ),
        Container(
          width: Adaptive.w(90),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: Adaptive.w(7),
              right: Adaptive.w(7),
            ),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (bool expanded) {
                  setState(() => isExpanded = expanded);
                },
                title: const TextWidget(
                  text: "Gönderilecek Kişi Ekle",
                ),
                trailing: isExpanded != true
                    ? const Icon(Icons.add_circle_outline,
                        size: 35, color: Constants.mainBackgroundColor)
                    : const Icon(Icons.remove_circle_outline,
                        size: 35, color: Constants.mainBackgroundColor),
                iconColor: Constants.mainBackgroundColor,
                children: [
                  Container(
                    width: Adaptive.w(90),
                    height: Adaptive.h(59),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Adaptive.w(5),
                          ),
                          child: const TextWidget(
                            text: "Adınız, Soyadınız",
                            color: Constants.labelTextColor,
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(1),
                        ),
                        const Center(
                          child: TextFormFieldWidget(
                              hintText: "Efe Semih Demirtaş"),
                        ),
                        SizedBox(
                          height: Adaptive.h(2),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Adaptive.w(5),
                          ),
                          child: const TextWidget(
                            text: "Mesajın",
                            color: Constants.labelTextColor,
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(1),
                        ),
                        const Center(
                          child: TextFormFieldWidget(
                            hintText: "Mesajını yaz...",
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(2),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Adaptive.w(5),
                          ),
                          child: const TextWidget(
                            text: "Telefon Numarası",
                            color: Constants.labelTextColor,
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(1),
                        ),
                        const Center(
                          child: TextFormFieldWidget(
                            hintText: "+90(---) -- --",
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(2),
                        ),
                        Center(
                          child: ButtonWidget(
                            onPressed: () {},
                            buttonText: "Ekle",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: Adaptive.h(2),
        ),
        SizedBox(
          height: Adaptive.h(4),
        ),
        Container(
          width: Adaptive.w(90),
          height: Adaptive.h(10),
          decoration: BoxDecoration(
            color: Constants.mainBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextWidget(
                    text: "Mehmet Soğukbulak",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                  TextWidget(
                      text: "+90539 488 34 41",
                      color: Colors.white,
                      fontSize: 16)
                ],
              ),
              SvgPicture.asset("assets/icons/trash.svg")
            ],
          ),
        ),
        SizedBox(
          height: Adaptive.h(8),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Adaptive.w(5),
          ),
          child: Row(
            children: const [
              TextWidget(
                text: "Kart Bilgileri",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Adaptive.h(3),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Adaptive.w(5),
              ),
              child: const TextWidget(
                text: "Adınız, Soyadınız",
                color: Constants.labelTextColor,
              ),
            ),
            SizedBox(
              height: Adaptive.h(1),
            ),
            Center(
              child: TextFormFieldWidget(
                hintText: "Efe Semih Demirtaş",
                width: Adaptive.w(90),
              ),
            ),
            SizedBox(
              height: Adaptive.h(2),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Adaptive.w(5),
              ),
              child: const TextWidget(
                text: "Kart Numarası",
                color: Constants.labelTextColor,
              ),
            ),
            SizedBox(
              height: Adaptive.h(1),
            ),
            Center(
              child: TextFormFieldWidget(
                hintText: "1905 4--- ---- ----",
                width: Adaptive.w(90),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: Adaptive.h(2),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Adaptive.w(5),
              ),
              child: const TextWidget(
                text: "Ccv",
                color: Constants.labelTextColor,
              ),
            ),
            SizedBox(
              height: Adaptive.h(1),
            ),
            Center(
              child: TextFormFieldWidget(
                hintText: "----",
                width: Adaptive.w(90),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: Adaptive.h(2),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Adaptive.w(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/icons/comment-check.svg"),
              SizedBox(
                width: Adaptive.w(4),
              ),
              SizedBox(
                width: Adaptive.w(80),
                child: const TextWidget(
                    text:
                        "Ön bilgilendirme Formu ve mesafeli sözleşmesini okudum kabul ediyorum."),
              )
            ],
          ),
        ),
        SizedBox(
          height: Adaptive.h(5),
        ),
        SizedBox(
          width: Adaptive.w(90),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TextWidget(
                    text: "Price",
                    color: Color(0xFF777777),
                    fontSize: 16,
                  ),
                  TextWidget(
                    text: "\$158.2",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(
                height: Adaptive.h(1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TextWidget(
                    text: "Tax",
                    color: Color(0xFF777777),
                    fontSize: 16,
                  ),
                  TextWidget(
                    text: "0.5%",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(
                height: Adaptive.h(1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TextWidget(
                    text: "Total Payment",
                    color: Color(0xFF777777),
                    fontSize: 16,
                  ),
                  TextWidget(
                    text: "\$158.2",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: Adaptive.h(3),
        ),
        Container(
          width: Adaptive.w(100),
          height: Adaptive.h(16),
          decoration: const BoxDecoration(
            color: Constants.mainBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: InkWell(
            onTap: () {
              try {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: Adaptive.h(50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/refresh.png",
                              width: Adaptive.w(30),
                            ),
                            SizedBox(
                              height: Adaptive.h(6),
                            ),
                            const TextWidget(
                              text: "Hediye Kartı Oluşturuluyor....",
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

                context.read<NavigationBloc>().add(ChangeNavigation(
                    state: CheckoutPageThreeState(), index: 0));
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: Adaptive.h(50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/warning.png",
                              width: Adaptive.w(30),
                            ),
                            SizedBox(
                              height: Adaptive.h(6),
                            ),
                            const TextWidget(
                              text:
                                  "Kredi kart bilgileri yanlış konrol ediniz.",
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
            child: Padding(
              padding: EdgeInsets.only(
                left: Adaptive.w(12),
                right: Adaptive.w(12),
                top: Adaptive.h(4),
                bottom: Adaptive.h(4),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: TextWidget(
                      text: "Ödemeyi Yap",
                      textAlign: TextAlign.center,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
