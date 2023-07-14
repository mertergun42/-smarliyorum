// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tap_bar_state.dart';

class TapBarCubit extends Cubit<TapBarState> {
  int currentIndex = 0;

  TapBarCubit() : super(TapBarClothes());

  void changeTabbar(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        emit(TapBarClothes());
        break;
      case 1:
        emit(TapBarMarket());
        break;
      case 2:
        emit(TapBarFood());
        break;
    }
  }
}
