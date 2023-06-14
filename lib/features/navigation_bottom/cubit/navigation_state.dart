part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationGetUserLoading extends NavigationState {}
class NavigationGetUserData extends NavigationState {}
class MainPageIndexUpdated extends NavigationState {
  final int index;
  MainPageIndexUpdated(this.index);
}
