part of 'employment_cubit.dart';

@immutable
abstract class EmploymentState {}

class EmploymentInitial extends EmploymentState {}
class ProvidersCitiesLoading extends EmploymentState {}
class ProvidersCitiesLoaded extends EmploymentState {}
class ProvidersCitiesError extends EmploymentState {}
