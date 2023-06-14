part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ProvidersHomeLoading extends HomeState {}
class SliderHomeLoading extends HomeState {}
class ProvidersHomeError extends HomeState {}
class SliderHomeError extends HomeState {}
class ProvidersHomeLoaded extends HomeState {}
