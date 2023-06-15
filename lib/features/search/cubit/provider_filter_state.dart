part of 'provider_filter_cubit.dart';

@immutable
abstract class ProvidersSearchState {}

class ProvidersSearchInitial extends ProvidersSearchState {}
class ProvidersSearchLoading extends ProvidersSearchState {}
class ProvidersSearchError extends ProvidersSearchState {}
class ProvidersSearchLoaded extends ProvidersSearchState {}
