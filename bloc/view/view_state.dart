part of 'view_bloc.dart';

@immutable
abstract class ViewState {}

class InitialState extends ViewState {}

class OnboardingState extends ViewState {}

class ViewAskState extends ViewState {}

class SignUpState extends ViewState {}

class VerificationState extends ViewState {}

class SignInState extends ViewState {}

class UserMainState extends ViewState {}
