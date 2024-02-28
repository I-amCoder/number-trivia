import 'package:dio/dio.dart';
import 'package:flutter_clean_new/core/connection/connection.dart';
import 'package:flutter_clean_new/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_clean_new/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_new/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_clean_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_clean_new/features/skeleton/providers/selected_page_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Create Service Loacator Instance
final sl = GetIt.instance;

Future<void> init() async {
  // Register Api Client
  sl.registerLazySingleton(() => Dio());
  sl.registerSingleton(await SharedPreferences.getInstance());

//   Register Network Connection Checker
  sl.registerLazySingleton(() => InternetConnectionChecker());

//   Register Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));



  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
      () => NumberTriviaRemoteDataSourceImpl(dio: sl()));

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
      () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()));



  sl.registerLazySingleton<NumberTriviaRepository>(() =>
      NumberTriviaRepositoryImpl(
          localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));

  //   Register Usecases

  sl.registerLazySingleton(
      () => GetConcreteNumberTrivia(numberTriviaRepository: sl()));
  sl.registerLazySingleton(
      () => GetRandomNumberTrivia(numberTriviaRepository: sl()));

//   Register Blocs
  sl.registerFactory(() => SelectedPageProvider());
  
  sl.registerFactory(() => NumberTriviaBloc(
      concreteNumberTriviaUsecase: sl(), randomNumberTriviaUsecase: sl()));
}
