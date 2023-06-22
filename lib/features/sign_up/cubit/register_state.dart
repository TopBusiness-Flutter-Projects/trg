part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class ProviderRegisterCitiesLoading extends RegisterState {}
class ProviderRegisterCitiesLoaded extends RegisterState {}
class ProviderRegisterCitiesError extends RegisterState {}
class ProviderRegisterServiceTypeLoading extends RegisterState {}
class ProviderRegisterServiceTypeLoaded extends RegisterState {}
class ProviderRegisterTypeLoaded extends RegisterState {}
class ProviderRegisterServiceTypeError extends RegisterState {}
class OnRegisterVaild extends RegisterState {}
class RegisterFailure extends RegisterState {}
class OnLoginVaildFaild extends RegisterState {}
class PhotoPicked extends RegisterState {}