part of 'navigation_provider_cubit.dart';

@immutable
abstract class NavigationProviderState {}

class NavigationProviderInitial extends NavigationProviderState {}

class NavigationProviderGetUserLoading extends NavigationProviderState {}
class NavigationProviderGetUserData extends NavigationProviderState {}
class MainPageIndexUpdated extends NavigationProviderState {
  final int index;
  MainPageIndexUpdated(this.index);
}
