import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomWillPopScopeNavigationWidget extends StatelessWidget {
  final Widget nextScreen;

  const CustomWillPopScopeNavigationWidget({
    required this.nextScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (context.read<NavigationBloc>().listState.length == 1) {
          return true;
        } else {
          context.read<NavigationBloc>().add(PreviousNavigation());
          return false;
        }
      },
      child: nextScreen,
    );
  }
}
