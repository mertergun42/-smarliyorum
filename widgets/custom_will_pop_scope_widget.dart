import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomWillPopScopeWidget extends StatelessWidget {
  final Widget nextScreen;

  const CustomWillPopScopeWidget({
    required this.nextScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (context.read<ViewBloc>().listState.length == 1) {
          return true;
        } else {
          context.read<ViewBloc>().add(PreviousView());
          return false;
        }
      },
      child: nextScreen,
    );
  }
}
