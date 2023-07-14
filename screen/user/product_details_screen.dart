import 'package:flutter/material.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/navigation_top_bar_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: Adaptive.w(100),
              height: Adaptive.h(126),
            ),
            Image.asset(
              "assets/images/product-details.png",
              fit: BoxFit.fill,
              width: Adaptive.w(100),
              height: Adaptive.h(60),
            ),
            const NavigationTopBarWidget(
              screenName: "",
              color: Colors.white,
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  SizedBox(
                    width: Adaptive.w(100),
                    height: Adaptive.h(81),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: Adaptive.w(100),
                      height: Adaptive.h(73),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Adaptive.w(5),
                          right: Adaptive.w(5),
                          top: Adaptive.h(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              text: "İçecekler",
                              color: Constants.mainBackgroundColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: Adaptive.h(0.5),
                            ),
                            const TextWidget(
                              text: "Women Sleep Suits by Femall",
                              color: Color(0xFF0E0E0E),
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(
                              height: Adaptive.h(1),
                            ),
                            const TextWidget(
                              text:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et",
                              color: Color(0xFF2B2B2B),
                            ),
                            SizedBox(
                              height: Adaptive.h(1),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 4.5,
                                      minRating: 1,
                                      itemSize: Adaptive.w(5),
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    SizedBox(
                                      height: Adaptive.h(1),
                                    ),
                                    TextWidget(
                                      text: "(256 Reviews)",
                                      color: const Color(0xFF2E2E2E)
                                          .withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: Adaptive.w(25),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: Adaptive.w(5),
                                      height: Adaptive.h(2.5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFA29698),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    SizedBox(
                                      width: Adaptive.w(3),
                                    ),
                                    Container(
                                      width: Adaptive.w(5),
                                      height: Adaptive.h(2.5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF80C6A9),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    SizedBox(
                                      width: Adaptive.w(3),
                                    ),
                                    Container(
                                      width: Adaptive.w(5),
                                      height: Adaptive.h(2.5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF8E84CA),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    SizedBox(
                                      width: Adaptive.w(3),
                                    ),
                                    Container(
                                      width: Adaptive.w(5),
                                      height: Adaptive.h(2.5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFE5907D),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: Adaptive.h(4),
                            ),
                            const TextWidget(
                              text: "İçindekiler",
                              color: Color(0xFF0E0E0E),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Adaptive.h(2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextWidget(
                                  text: "Brand",
                                  color: Color(0xFF0E0E0E),
                                  fontWeight: FontWeight.w800,
                                ),
                                TextWidget(
                                  text: "Femall Clothing",
                                  color: Colors.black.withOpacity(0.71),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Adaptive.h(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextWidget(
                                  text: "Weight",
                                  color: Color(0xFF0E0E0E),
                                  fontWeight: FontWeight.w800,
                                ),
                                TextWidget(
                                  text: "260gr",
                                  color: Colors.black.withOpacity(0.71),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Adaptive.h(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextWidget(
                                  text: "Condition",
                                  color: Color(0xFF0E0E0E),
                                  fontWeight: FontWeight.w800,
                                ),
                                TextWidget(
                                  text: "NEW",
                                  color: Colors.black.withOpacity(0.71),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Adaptive.h(1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                TextWidget(
                                  text: "Category",
                                  color: Color(0xFF0E0E0E),
                                  fontWeight: FontWeight.w800,
                                ),
                                TextWidget(
                                  text: "Sleep Suits",
                                  color: Constants.mainBackgroundColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: Adaptive.h(2),
                            ),
                            Container(
                              width: Adaptive.w(100),
                              height: 1,
                              color: const Color(0xFFF9F9F9),
                            ),
                            SizedBox(
                              height: Adaptive.h(3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: Adaptive.w(12),
                    top: Adaptive.h(5),
                    child: Row(
                      children: [
                        Container(
                          width: Adaptive.w(10),
                          height: Adaptive.h(5),
                          decoration: BoxDecoration(
                            color: Constants.mainBackgroundColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: Adaptive.w(4),
                          ),
                        ),
                        SizedBox(
                          width: Adaptive.w(30),
                        ),
                        Container(
                          width: Adaptive.w(35),
                          height: Adaptive.h(6),
                          decoration: BoxDecoration(
                            color: Constants.secondBackgroundColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: Adaptive.w(5),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: Adaptive.w(5),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Adaptive.w(7),
                          right: Adaptive.w(20),
                          top: Adaptive.h(3),
                          bottom: Adaptive.h(3),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextWidget(
                                  text: "\$46.67",
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                      text: "\$50.00",
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                    SizedBox(
                                      width: Adaptive.w(3),
                                    ),
                                    const TextWidget(
                                      text: "20% OFF",
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Adaptive.h(2.5),
                              ),
                              child: const TextWidget(
                                text: "Ismarla",
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
