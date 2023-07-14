import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NavigationTopBarWidget extends StatelessWidget {
  final String screenName;
  final Color? color;

  const NavigationTopBarWidget(
      {Key? key, required this.screenName, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: Adaptive.w(90),
      child: Column(
        children: [
          SizedBox(
            height: Adaptive.h(6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.read<NavigationBloc>().add(PreviousNavigation());
                },
                child: SvgPicture.asset(
                  "assets/icons/left-arrow.svg",
                  width: Adaptive.w(2),
                  color: color,
                ),
              ),
              TextWidget(
                text: screenName,
                fontFamily: "FontBold",
                color: color,
                fontSize: 20,
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/option.svg",
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
