import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  List<NavigationState> listState = [NavigationInitial()];
  List<int> listButton = [0];
  int currentIndex = 0;

  NavigationBloc() : super(NavigationInitial()) {
    on<ChangeNavigation>((event, emit) {
      listState.add(event.state);
      listButton.add(event.index);
      emit(event.state);
    });
    on<PreviousNavigation>((event, emit) {
      listState.removeLast();
      listButton.removeLast();
      NavigationState state = listState.last;
      emit(state);
    });
    on<ResetList>((event, emit) {
      listState.clear();
      listButton.clear();
      listState = [NavigationInitial()];
      listButton = [0];
      emit(listState.last);
    });
  }
}
