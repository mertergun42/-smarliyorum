import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/screen/initial/onboarding_screen.dart';
import 'package:ismarliyorum/screen/initial/sign_in_screen.dart';
import 'package:ismarliyorum/screen/initial/verification_screen.dart';
import 'package:ismarliyorum/screen/initial/sign_up_screen.dart';
import 'package:ismarliyorum/screen/initial/splash_screen.dart';
import 'package:ismarliyorum/screen/initial/view_ask_screen.dart';
import 'package:ismarliyorum/screen/user/user_main_page.dart';
import 'package:ismarliyorum/widgets/custom_will_pop_scope_widget.dart';

class Ismarliyorum extends StatelessWidget {
  const Ismarliyorum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<ViewBloc, ViewState>(
          builder: (context, ViewState state) {
            return AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                switchInCurve: Curves.linear,
                child: getRoute(state, context));
          },
          bloc: BlocProvider.of<ViewBloc>(context),
        ),
      ),
    );
  }

  Widget getRoute(ViewState state, BuildContext context) {
    if (state is InitialState) {
      return const CustomWillPopScopeWidget(
        nextScreen: SplashScreen(),
      );
    }

    if (state is ViewAskState) {
      return const CustomWillPopScopeWidget(
        nextScreen: ViewAskScreen(),
      );
    }

    if (state is OnboardingState) {
      return const CustomWillPopScopeWidget(
        nextScreen: OnboardingScreen(),
      );
    }

    if (state is VerificationState) {
      return const CustomWillPopScopeWidget(
        nextScreen: VerificationScreen(),
      );
    }

    if (state is SignUpState) {
      return const CustomWillPopScopeWidget(
        nextScreen: SignUpScreen(),
      );
    }

    if (state is SignInState) {
      return const CustomWillPopScopeWidget(
        nextScreen: SignInScreen(),
      );
    }

    if (state is UserMainState) {
      return const UserMainPage();
    }

    throw Exception('Error');
  }
}
