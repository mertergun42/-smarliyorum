import 'package:ismarliyorum/bloc/navigation/navigation_bloc.dart';
import 'package:ismarliyorum/bloc/tap_bar/tap_bar_cubit.dart';
import 'package:ismarliyorum/bloc/view/view_bloc.dart';
import 'package:ismarliyorum/screen/initial/ismarliyorum.dart';
import 'package:ismarliyorum/utils/check_internet_connection.dart';
import 'package:ismarliyorum/utils/locator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ismarliyorum/bloc/internet_connect/internet_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final internetChecker = CheckInternetConnection();

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  setupLocator();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Ismarlıyorum',
          debugShowCheckedModeBanner: false,
          home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: const Scaffold(
              body: CheckInternet(),
            ),
          ),
        );
      },
    ),
  );
}

class CheckInternet extends StatelessWidget {
  const CheckInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => InternetCubit(connectivity: Connectivity())),
        BlocProvider(create: (context) => ViewBloc()),
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(create: (context) => TapBarCubit()),
      ],
      child: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, InternetState state) {
          if (state is InternetDisconnected) {
            return const Scaffold(
              body: Center(
                child: Text("İnternet Bağlantısı Yok"),
              ),
            );
          } else if (state is InternetConnected) {
            return const Ismarliyorum();
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
