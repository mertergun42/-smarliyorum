import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:ismarliyorum/bloc/tap_bar/tap_bar_cubit.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/navigation_top_bar_widget.dart';
import 'package:ismarliyorum/widgets/search_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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

  List productName = [
    "Black Hat with White Suits",
    "Brown Women Shirts by Coklat Cloth",
    "Brown Women Shirts by Coklat Cloth",
  ];

  List productImages = [
    "assets/images/product-one.png",
    "assets/images/product-two.png",
    "assets/images/product-three.png",
  ];

  List productPrice = [
    "\$98.12",
    "\$24.56",
    "\$24.56",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavigationTopBarWidget(screenName: "Kategoriler"),
        SizedBox(
          height: Adaptive.h(3),
        ),
        const SearchWidget(),
        SizedBox(
          height: Adaptive.h(4),
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
            return SizedBox(
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
                      InkWell(
                        onTap: () {
                          if (index == 2) {
                            context.read<NavigationBloc>().add(ChangeNavigation(
                                state: ProductDetailsState(), index: 0));
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: Adaptive.w(32),
                                  height: Adaptive.h(18),
                                ),
                                SizedBox(
                                  width: Adaptive.w(28),
                                  height: Adaptive.h(18),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        productImages[index],
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Positioned(
                                  right: Adaptive.w(8),
                                  top: Adaptive.h(2),
                                  child: Image.asset("assets/images/heart.png"),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: Adaptive.h(4),
                                  child: Container(
                                    width: Adaptive.w(8),
                                    height: Adaptive.h(4),
                                    decoration: BoxDecoration(
                                      color: Constants.secondBackgroundColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: Adaptive.w(3.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: Adaptive.w(52),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(0.4),
                                  ),
                                  TextWidget(
                                    text: productName[index],
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(0.4),
                                  ),
                                  TextWidget(
                                    text: productPrice[index],
                                    color: Constants.mainBackgroundColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Adaptive.h(4)),
                    ],
                  );
                },
              ),
            );
          }
          if (state is TapBarFood) {
            return SizedBox(
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
                      InkWell(
                        onTap: () {
                          if (index == 2) {
                            context.read<NavigationBloc>().add(ChangeNavigation(
                                state: ProductDetailsState(), index: 0));
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: Adaptive.w(32),
                                  height: Adaptive.h(18),
                                ),
                                SizedBox(
                                  width: Adaptive.w(28),
                                  height: Adaptive.h(18),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        productImages[index],
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Positioned(
                                  right: Adaptive.w(8),
                                  top: Adaptive.h(2),
                                  child: Image.asset("assets/images/heart.png"),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: Adaptive.h(4),
                                  child: Container(
                                    width: Adaptive.w(8),
                                    height: Adaptive.h(4),
                                    decoration: BoxDecoration(
                                      color: Constants.secondBackgroundColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: Adaptive.w(3.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: Adaptive.w(52),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(0.4),
                                  ),
                                  TextWidget(
                                    text: productName[index],
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                  SizedBox(
                                    height: Adaptive.h(0.4),
                                  ),
                                  TextWidget(
                                    text: productPrice[index],
                                    color: Constants.mainBackgroundColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Adaptive.h(4)),
                    ],
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ],
    );
  }
}
