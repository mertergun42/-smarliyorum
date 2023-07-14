import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:ismarliyorum/bloc/tap_bar/tap_bar_cubit.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/search_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  double _page = 10;

  @override
  Widget build(BuildContext context) {
    List categoryName = [
      "Giyim",
      "Market",
      "Aksesuar",
      "Yemek",
    ];

    List categoryImages = [
      "assets/images/category-image.png",
      "assets/images/category-image.png",
      "assets/images/category-image.png",
      "assets/images/category-image.png",
    ];

    List newsImages = [
      "assets/images/new-one.png",
      "assets/images/new-two.png",
    ];

    List newsTitle = [
      "Tatlılar",
      "Tatlılar",
    ];

    List newsName = [
      "Pink Summer Sweater with Flow..",
      "Pink Summer Sweater with Flow..",
    ];

    List newsPrice = [
      "\$83.4",
      "\$83.4",
    ];

    List newsOldPrice = [
      "\$170",
      "\$170",
    ];

    double width = MediaQuery.of(context).size.width;
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
          },
        );
      },
    );

    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: Adaptive.h(8),
            ),
            Center(
              child: SizedBox(
                width: Adaptive.w(90),
                child: Row(
                  children: [
                    SizedBox(
                      width: Adaptive.w(2),
                    ),
                    SvgPicture.asset("assets/icons/logo.svg"),
                    SizedBox(
                      width: Adaptive.w(20),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/photo.png"),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(4),
            ),
            Padding(
              padding: EdgeInsets.only(left: Adaptive.w(5), right: Adaptive.w(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Adaptive.w(75),
                    child: const SearchWidget(),
                  ),
                  SvgPicture.asset("assets/icons/bell-ring.svg")
                ],
              ),
            ),
            SizedBox(
              height: Adaptive.h(4),
            ),
            InkWell(
              onTap: () {
                context.read<NavigationBloc>().add(
                      ChangeNavigation(state: FeaturedProductState(), index: 0),
                    );
              },
              child: SizedBox(
                width: Adaptive.w(90),
                height: Adaptive.h(24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "assets/images/promotion-img.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.h(4),
            ),
            Padding(
              padding: EdgeInsets.only(left: Adaptive.w(5), right: Adaptive.w(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    text: "Kategoriler",
                    color: Color(0xFF22292E),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<NavigationBloc>()
                          .add(ChangeNavigation(state: ProductsState(), index: 0));
                    },
                    child: const TextWidget(
                      text: "Tümü",
                      color: Constants.mainBackgroundColor,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Adaptive.h(3),
            ),
            BlocBuilder<TapBarCubit, TapBarState>(
              builder: (context, state) {
                return SizedBox(
                  width: Adaptive.w(90),
                  height: Adaptive.h(14),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: categoryName.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      List categoryName = [
                        "Giyim",
                        "Market",
                        "Aksesuar",
                        "Yemek",
                      ];

                      List<Color> bgColor = [
                        const Color(0xFFE4F3EA),
                        const Color(0xFFFFECE8),
                        const Color(0xFFFFF6E4),
                        const Color(0xFFF1EDFC),
                      ];

                      List images = [
                        "assets/images/category-one.png",
                        "assets/images/category-two.png",
                        "assets/images/category-three.png",
                        "assets/images/category-four.png",
                      ];

                      if (index == 0) {
                        return InkWell(
                          onTap: () {
                            if (context.read<TapBarCubit>().currentIndex != index) {
                              context.read<TapBarCubit>().changeTabbar(index);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Adaptive.w(12),
                                    height: Adaptive.h(6),
                                    decoration: BoxDecoration(
                                      color: bgColor[index],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        Adaptive.w(2),
                                      ),
                                      child: Image.asset(images[index]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(1),
                                  ),
                                  TextWidget(
                                    text: categoryName[index],
                                    color: const Color(0xFF22292E),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: Adaptive.w(12),
                              ),
                            ],
                          ),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          if (context.read<TapBarCubit>().currentIndex != index) {
                            context.read<TapBarCubit>().changeTabbar(index);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Adaptive.w(12),
                                  height: Adaptive.h(6),
                                  decoration: BoxDecoration(
                                    color: bgColor[index],
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      Adaptive.w(2),
                                    ),
                                    child: Image.asset(images[index]),
                                  ),
                                ),
                                SizedBox(
                                  height: Adaptive.h(1),
                                ),
                                TextWidget(
                                  text: categoryName[index],
                                  color: const Color(0xFF22292E),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: Adaptive.w(12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: Adaptive.h(2),
            ),
            BlocBuilder<TapBarCubit, TapBarState>(builder: (context, state) {
              if (state is TapBarClothes) {
                return Stack(
                  children: [
                    SizedBox(
                      height: width * .90,
                      width: width,
                      child: LayoutBuilder(
                        builder: (context, boxConstraints) {
                          List<Widget> cards = [];

                          for (int i = 0; i <= 3; i++) {
                            double currentPageValue = i - _page;
                            bool pageLocation = currentPageValue > 0;

                            double start = 15 +
                                max(
                                    (boxConstraints.maxWidth - width * .75) -
                                        ((boxConstraints.maxWidth - width * .75) /
                                                2) *
                                            -currentPageValue *
                                            (pageLocation ? 9 : 1),
                                    0.0);

                            var customizableCard = Positioned.directional(
                              top: 0 + 20 * max(-currentPageValue, 0.0),
                              bottom: 20 + 20 * max(-currentPageValue, 0.0),
                              start: start,
                              textDirection: TextDirection.rtl,
                              child: Container(
                                height: width * .67,
                                width: width * .67,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  image: DecorationImage(
                                    image: AssetImage(categoryImages[i]),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(.15),
                                        blurRadius: 10)
                                  ],
                                ),
                              ),
                            );
                            cards.add(customizableCard);
                          }
                          return Stack(children: cards);
                        },
                      ),
                    ),
                    Positioned.fill(
                      child: PageView.builder(
                        reverse: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: 3,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                );
              }
              if (state is TapBarMarket) {
                return Stack(
                  children: [
                    SizedBox(
                      height: width * .90,
                      width: width,
                      child: LayoutBuilder(
                        builder: (context, boxConstraints) {
                          List<Widget> cards = [];

                          for (int i = 0; i <= 3; i++) {
                            double currentPageValue = i - _page;
                            bool pageLocation = currentPageValue > 0;

                            double start = 15 +
                                max(
                                    (boxConstraints.maxWidth - width * .75) -
                                        ((boxConstraints.maxWidth - width * .75) /
                                                2) *
                                            -currentPageValue *
                                            (pageLocation ? 9 : 1),
                                    0.0);

                            var customizableCard = Positioned.directional(
                              top: 0 + 20 * max(-currentPageValue, 0.0),
                              bottom: 20 + 20 * max(-currentPageValue, 0.0),
                              start: start,
                              textDirection: TextDirection.rtl,
                              child: Container(
                                height: width * .67,
                                width: width * .67,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  image: DecorationImage(
                                    image: AssetImage(categoryImages[i]),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(.15),
                                        blurRadius: 10)
                                  ],
                                ),
                              ),
                            );
                            cards.add(customizableCard);
                          }
                          return Stack(children: cards);
                        },
                      ),
                    ),
                    Positioned.fill(
                      child: PageView.builder(
                        reverse: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: 3,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
            Padding(
              padding: EdgeInsets.only(left: Adaptive.w(5), right: Adaptive.w(5)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: "Casual Maroon Outfits",
                        fontWeight: FontWeight.w800,
                        color: Constants.secondTextColor,
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: Adaptive.h(0.5),
                      ),
                      const TextWidget(
                        text: "İçecekler",
                        fontWeight: FontWeight.w500,
                        color: Constants.mainBackgroundColor,
                        fontSize: 12,
                      ),
                      SizedBox(
                        height: Adaptive.h(0.5),
                      ),
                      Row(
                        children: [
                          const TextWidget(
                            text: "\$34.51",
                            fontWeight: FontWeight.w900,
                            color: Constants.mainBackgroundColor,
                            fontSize: 18,
                          ),
                          SizedBox(
                            width: Adaptive.w(4),
                          ),
                          const TextWidget(
                            text: "\$40.00",
                            color: Color(0xFFADADAD),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: Adaptive.h(6),
            ),
            Padding(
              padding: EdgeInsets.only(left: Adaptive.w(5), right: Adaptive.w(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TextWidget(
                    text: "Yeniler",
                    fontWeight: FontWeight.w900,
                    color: Constants.buttonTextColor,
                    fontSize: 20,
                  ),
                  TextWidget(
                    text: "Tümü",
                    fontWeight: FontWeight.w900,
                    color: Constants.mainBackgroundColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Adaptive.h(3),
            ),
            SizedBox(
              width: Adaptive.w(90),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: newsName.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: Adaptive.w(90),
                            height: Adaptive.h(22),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                newsImages[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            top: Adaptive.h(2),
                            right: Adaptive.w(5),
                            child: Image.asset(
                              "assets/images/heart.png",
                            ),
                          ),
                          Positioned(
                            bottom: Adaptive.h(2),
                            right: Adaptive.w(2),
                            child: Container(
                              width: Adaptive.w(12),
                              height: Adaptive.h(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  Adaptive.w(3),
                                ),
                                child: Image.asset("assets/images/giftbox.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(2),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: newsTitle[index],
                                color: Constants.mainBackgroundColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: Adaptive.h(0.5),
                              ),
                              TextWidget(
                                text: newsName[index],
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                              SizedBox(
                                height: Adaptive.h(0.5),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: newsPrice[index],
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                              SizedBox(
                                width: Adaptive.w(4),
                              ),
                              TextWidget(
                                text: newsOldPrice[index],
                                color: const Color(0xFF777777),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/star.svg"),
                              SizedBox(
                                width: Adaptive.w(2),
                              ),
                              const TextWidget(
                                text: "4.5",
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(4),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: Adaptive.h(8),
            ),
          ],
        ),
      ),
    );
  }
}
