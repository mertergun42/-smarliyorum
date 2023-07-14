// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/repository/hive_repository.dart';
import 'package:ismarliyorum/utils/constants.dart';
import 'package:ismarliyorum/utils/locator.dart';
import 'package:ismarliyorum/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final HiveRepository hiveClient = locator<HiveRepository>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) async {
      bool? value = await hiveClient.getIntroValue();
      if (value!) {
        context.read<ViewBloc>().add(ChangeView(state: ViewAskState()));
      } else {
        hiveClient.setIntroValue();
        context.read<ViewBloc>().add(ChangeView(state: OnboardingState()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(100),
      height: Adaptive.h(100),
      color: Constants.mainBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Adaptive.h(75),
            child: Padding(
              padding: EdgeInsets.all(Adaptive.w(12)),
              child: SvgPicture.asset(
                "assets/icons/main-logo.svg",
              ),
            ),
          ),
          TextWidget(
            text: "ısmarlıyorum App\n\nv1.0.0",
            color: Colors.white.withOpacity(0.4),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
