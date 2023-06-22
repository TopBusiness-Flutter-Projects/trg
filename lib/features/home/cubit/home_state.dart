part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ProvidersHomeLoading extends HomeState {}
class SliderHomeLoading extends HomeState {}
class ProvidersHomeError extends HomeState {}
class SliderHomeError extends HomeState {}
class ProvidersHomeLoaded extends HomeState {}
class ProvidersHomeCitiesLoading extends HomeState {}
class ProvidersHomeCitiesLoaded extends HomeState {}
class ProvidersHomeCitiesError extends HomeState {}
class ProvidersHomeServiceTypeLoading extends HomeState {}
class ProvidersHomeServiceTypeLoaded extends HomeState {}
class ProvidersHomeServiceTypeError extends HomeState {}
