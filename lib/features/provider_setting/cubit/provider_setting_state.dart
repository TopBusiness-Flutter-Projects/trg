part of 'provider_setting_cubit.dart';

@immutable
abstract class ProviderSettingState {}

class ProviderSettingInitial extends ProviderSettingState {}
class ProviderUserSetting extends ProviderSettingState {}
//***************************************************************
class DeleteUserSuccessfully extends ProviderSettingState {}
class DeleteUserFailure extends ProviderSettingState {}
