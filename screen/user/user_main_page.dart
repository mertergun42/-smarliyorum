import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/screen/user/checkout_page_one_screen.dart';
import 'package:ismarliyorum/screen/user/checkout_page_three_screen.dart';
import 'package:ismarliyorum/screen/user/checkout_page_two_screen.dart';
import 'package:ismarliyorum/screen/user/featured_product_screen.dart';
import 'package:ismarliyorum/screen/user/product_details_screen.dart';
import 'package:ismarliyorum/screen/user/products_screen.dart';
import 'package:ismarliyorum/screen/user/shopping_cart_screen.dart';
import 'package:ismarliyorum/screen/user/user_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/widgets/custom_will_pop_scope_navigation_widget.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({super.key});

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<IconData> menuItems = [
    Icons.person,
    Icons.qr_code_outlined,
    Icons.send_rounded,
    Icons.shopping_cart_rounded,
    Icons.notifications,
    Icons.my_library_books_outlined,
    Icons.menu_book_outlined,
    Icons.exit_to_app,
  ];

  List itemName = [
    "Profil",
    "Qr Kodum",
    "Gönderilenler",
    "Sepetim",
    "Bildirimler",
    "Yapılan Işlemler",
    "Gizlilik Sözleşmesi",
    "Çıkış",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(100),
      height: Adaptive.h(100),
      child: Scaffold(
        body: Stack(
          children: [
            FancyDrawerWrapper(
              backgroundColor: Constants.mainBackgroundColor,
              controller: _controller,
              drawerPadding: EdgeInsets.only(
                left: Adaptive.w(7),
                right: Adaptive.w(7),
              ),
              drawerItems: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/images/photo.png",
                            width: Adaptive.w(15),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(1),
                        ),
                        const TextWidget(
                          text: "Efe Demirtaş",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: Adaptive.h(0.2),
                        ),
                        TextWidget(
                          text: "efes@mail.com",
                          color: Colors.white.withOpacity(0.6),
                        ),
                        SizedBox(
                          height: Adaptive.h(2),
                        ),
                        Container(
                          width: Adaptive.w(28),
                          height: Adaptive.h(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/icons/shopping-bag.svg"),
                              const TextWidget(
                                text: "600 TL",
                                color: Constants.mainBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Adaptive.h(2),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemCount: itemName.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: Adaptive.w(50),
                      height: Adaptive.h(5),
                      child: InkWell(
                        onTap: () {
                          if (index == 0) {
                            context.read<NavigationBloc>().add(ChangeNavigation(
                                state: NavigationInitial(), index: 0));
                          }
                          if (index == 3) {
                            context.read<NavigationBloc>().add(ChangeNavigation(
                                state: CheckoutPageOneState(), index: 0));
                          }
                          if (index == 5) {
                            context.read<NavigationBloc>().add(ChangeNavigation(
                                state: ShoppingCartState(), index: 0));
                          }
                          if (index == 7) {
                            context.read<NavigationBloc>().add(ResetList());
                            context.read<ViewBloc>().add(GetLoginScreen());
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              menuItems[index],
                              color: Colors.white.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: Adaptive.w(5),
                            ),
                            SizedBox(
                              width: Adaptive.w(40),
                              child: TextWidget(
                                text: itemName[index],
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Adaptive.h(0.5),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          text: "Ismarlıyorum App",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: Adaptive.h(0.5),
                        ),
                        TextWidget(
                          text: "App Version 1.0.0",
                          color: Colors.white.withOpacity(0.44),
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              child: Scaffold(
                body: SingleChildScrollView(
                  child: BlocBuilder<NavigationBloc, NavigationState>(
                    builder: (context, NavigationState state) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        switchInCurve: Curves.linear,
                        child: getRoute(state, context),
                      );
                    },
                    bloc: BlocProvider.of<NavigationBloc>(context),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Adaptive.h(1.5),
              right: Adaptive.w(3),
              child: InkWell(
                onTap: () {
                  _controller.toggle();
                },
                child: Container(
                  width: Adaptive.w(14),
                  height: Adaptive.h(7),
                  decoration: BoxDecoration(
                    color: Constants.mainBackgroundColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.4), width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      Adaptive.w(5),
                    ),
                    child: Image.asset("assets/images/group.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getRoute(NavigationState state, BuildContext context) {
    if (state is NavigationInitial) {
      return const UserMainScreen();
    }

    if (state is ProductsState) {
      return const CustomWillPopScopeNavigationWidget(
        nextScreen: ProductsScreen(),
      );
    }

    if (state is ProductDetailsState) {
      return const CustomWillPopScopeNavigationWidget(
        nextScreen: ProductDetailsScreen(),
      );
    }

    if (state is CheckoutPageOneState) {
      return const CustomWillPopScopeNavigationWidget(
        nextScreen: CheckoutPageOneScreen(),
      );
    }

    if (state is CheckoutPageTwoState) {
      return const CustomWillPopScopeNavigationWidget(
        nextScreen: CheckoutPageTwoScreen(),
      );
    }

    if (state is CheckoutPageThreeState) {
      return const CustomWillPopScopeNavigationWidget(
        nextScreen: CheckoutPageThreeScreen(),
      );
    }

    if (state is ShoppingCartState) {
      return const CustomWillPopScopeNavigationWidget(
        nextScreen: ShoppingCartScreen(),
      );
    }

    if (state is FeaturedProductState) {
      return const CustomWillPopScopeNavigationWidget(
        nextScreen: FeaturedProductScreen(),
      );
    }

    throw Exception('Error');
  }
}
