import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/navigation_top_bar_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutPageOneScreen extends StatelessWidget {
  const CheckoutPageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List productName = [
      "Long Grey Bomber Jackets",
      "Black Dress with Dotted ..",
    ];

    List productDescription = [
      "Grey Variant",
      "Grey Variant",
    ];

    List productImages = [
      "assets/images/product-one.png",
      "assets/images/product-two.png",
    ];

    List productPrice = [
      "\$158.2",
      "\$158.2",
    ];

    List productOldPrice = [
      "\$170",
      "\$170",
    ];

    return SizedBox(
      height: Adaptive.h(100),
      child: Stack(
        children: [
          Column(
            children: [
              const NavigationTopBarWidget(screenName: "Hediye Sepet"),
              SizedBox(
                height: Adaptive.h(4),
              ),
              SizedBox(
                width: Adaptive.w(90),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemCount: productName.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Adaptive.w(55),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: productName[index],
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(0.5),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text: productDescription[index],
                                        color: const Color(0xFF777777),
                                      ),
                                      const TextWidget(
                                        text: "2x",
                                        color: Color(0xFF777777),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(0.5),
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: productPrice[index],
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                        width: Adaptive.w(6),
                                      ),
                                      TextWidget(
                                        text: productOldPrice[index],
                                        color: const Color(0xFF777777),
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                productImages[index],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Adaptive.h(1.5),
                        ),
                        Container(
                          width: Adaptive.w(100),
                          height: 1,
                          color: const Color(0xFFF1F1F1),
                        ),
                        SizedBox(
                          height: Adaptive.h(1.5),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: Adaptive.h(2),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Adaptive.w(5),
                  right: Adaptive.w(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/shopping-bag.svg"),
                        SizedBox(
                          width: Adaptive.w(5),
                        ),
                        const TextWidget(
                          text: "Yeni Ürün Ekle",
                          color: Constants.mainBackgroundColor,
                          fontWeight: FontWeight.w800,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Adaptive.h(4),
                    ),
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
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
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
                  context.read<NavigationBloc>().add(ChangeNavigation(
                      state: CheckoutPageTwoState(), index: 0));
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/giftbox.png"),
                        SizedBox(
                          width: Adaptive.w(4),
                        ),
                        const TextWidget(
                          text: "Ismarla",
                          fontFamily: "FontBold",
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
