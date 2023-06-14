import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';

import '../model/cities_data_model.dart';
import '../model/provider_data_model.dart';
import '../model/slider_data_model.dart';
import '../preferences/preferences.dart';

class ServiceApi {
  final BaseApiConsumer dio;

  ServiceApi(this.dio);

  Future<Either<Failure, ProviderDataModel>> getProvidersHome(
     ) async {
    // String lan = await Preferences.in!stance.getSavedLang();
    try {
      final response = await dio.get(
        EndPoints.providerhomeListUrl ,

      );
      print(response);
      return Right(ProviderDataModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, SliderDataModel>> getSlider(
     ) async {
    // String lan = await Preferences.in!stance.getSavedLang();
    try {
      final response = await dio.get(
        EndPoints.sliderhomeListUrl ,

      );
      print(response);
      return Right(SliderDataModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, CitiesDataModel>> getCities(
     ) async {
    // String lan = await Preferences.in!stance.getSavedLang();
    try {
      final response = await dio.get(
        EndPoints.citiesListUrl ,

      );
      print(response);
      return Right(CitiesDataModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
