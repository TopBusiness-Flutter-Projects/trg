part of 'provider_filter_cubit.dart';

@immutable
abstract class ProviderFilterState {}

class ProviderFilterInitial extends ProviderFilterState {}
class ProvidersProviderFilterLoading extends ProviderFilterState {}
class ProvidersProviderFilterError extends ProviderFilterState {}
class ProvidersProviderFilterLoaded extends ProviderFilterState {}
