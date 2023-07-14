part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class ChangeNavigation extends NavigationEvent {
  final NavigationState state;
  final int index;

  ChangeNavigation({required this.state, required this.index});
}

class PreviousNavigation extends NavigationEvent {}

class ResetList extends NavigationEvent {}
