part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class ProductsState extends NavigationState {}

class ProductDetailsState extends NavigationState {}

class CheckoutPageOneState extends NavigationState {}

class CheckoutPageTwoState extends NavigationState {}

class CheckoutPageThreeState extends NavigationState {}

class ShoppingCartState extends NavigationState {}

class FeaturedProductState extends NavigationState {}
