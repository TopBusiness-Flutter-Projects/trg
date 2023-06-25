import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trj/core/model/service_type_data_model.dart';
import 'package:trj/features/login/model/login_model.dart';
import '../../features/sign_up/model/register_model.dart';
import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';

import '../model/cities_data_model.dart';
import '../model/provider_data_model.dart';
import '../model/slider_data_model.dart';
import '../model/user_model.dart';
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
  Future<Either<Failure, ProviderDataModel>> getProvidersProviderFilter(String search_key,int providerType,int cityId,int servideTypeId,int person_type
     ) async {
    // String lan = await Preferences.in!stance.getSavedLang();
    try {
      final response = await dio.get(
        EndPoints.providerFilterListUrl ,
        queryParameters: {
          "city_id":cityId!=0? cityId:"",
          "search_key":search_key,
          "translation_type_id":servideTypeId!=0?servideTypeId:"",
          "provider_type":providerType!=0?providerType:"",
          "person_type":person_type!=0?person_type:""
        }

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
  Future<Either<Failure, ServicesTypeDataModel>> getservieType(
     ) async {
    // String lan = await Preferences.in!stance.getSavedLang();
    try {
      final response = await dio.get(
        EndPoints.serviceTypeListUrl ,

      );
      print(response);
      return Right(ServicesTypeDataModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, UserModel>> registerUser(RegisterModel userData) async {
    try {
      final response = await dio.post(
        EndPoints.registerUrl,
        formDataIsEnabled: true,
        body: await userData.updateToJson(),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, UserModel>> UpdateUser(RegisterModel userData) async {
    try {
      UserModel loginModel = await Preferences.instance.getUserModel();

      final response = await dio.post(
        options: Options(
          headers: {'Authorization': loginModel.data!.accessToken!},
        ),
        EndPoints.updateUrl,
        formDataIsEnabled: true,
        body: await userData.updateuserToJson(),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, UserModel>> postLogin(LoginModel model) async {
    try {
      final response = await dio.post(
        EndPoints.loginUrl,
        body: {
          'email': model.email,
          'password': model.password,
        },
      );
      return Right(UserModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
