import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/config/constants.dart';
import 'package:rick_and_morty/data/repositories/favorite_character.dart/repository.dart';
import 'package:rick_and_morty/data/repositories/rick_and_morty/repository.dart';
import 'package:rick_and_morty/data/sqlfite/favorite_characters/database.dart';
import 'package:rick_and_morty/domain/use_cases/add_to_favorite_characters_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/delete_favorite_character_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_character_details_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty/domain/use_cases/get_favorite_characters_use_case.dart';
import 'package:rick_and_morty/services/rick_and_morty_api/api.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  await _configureLocalStorages();
  _configureNetworkDependencies();
  _configureApiClients();
  _configureRepositories();
  _configureUseCases();
}

Future<void> _configureLocalStorages() async {
  final FavoriteCharactersDatabase databaseService =
      FavoriteCharactersDatabase.instance;

  final sqfliteDb = await databaseService.database;

  getIt.registerLazySingleton<Database>(() => sqfliteDb);
}

void _configureNetworkDependencies() {
  final Dio dio = Dio();
  getIt.registerSingleton<Dio>(dio);
}

void _configureApiClients() {
  final dio = getIt.get<Dio>();
  final String privateBaseUrl = AppConstants.rickAndMortyApiUrl;

  getIt.registerLazySingleton<RickAndMortyApiClient>(
    () => RickAndMortyApiClient(dio, baseUrl: privateBaseUrl),
  );
}

void _configureRepositories() {
  final RickAndMortyApiClient rickAndMortyApiClient =
      getIt.get<RickAndMortyApiClient>();
  final Database favoriteCharactersDatabase = getIt.get<Database>();
  getIt
    ..registerLazySingleton<FavoriteCharactersRepository>(
      () => FavoriteCharactersRepository(database: favoriteCharactersDatabase),
    )
    ..registerLazySingleton<RickAndMortyRepository>(
      () => RickAndMortyRepository(apiClient: rickAndMortyApiClient),
    );
}

void _configureUseCases() {
  final RickAndMortyRepository rickAndMortyRepository =
      getIt.get<RickAndMortyRepository>();
  final FavoriteCharactersRepository favoriteCharactersRepository =
      getIt.get<FavoriteCharactersRepository>();

  getIt
    ..registerLazySingleton<GetFavoriteCharactersUseCase>(
      () => GetFavoriteCharactersUseCase(favoriteCharactersRepository),
    )
    ..registerLazySingleton<DeleteFavoriteCharactersUseCase>(
      () => DeleteFavoriteCharactersUseCase(favoriteCharactersRepository),
    )
    ..registerLazySingleton<AddToFavoriteCharactersUseCase>(
      () => AddToFavoriteCharactersUseCase(favoriteCharactersRepository),
    )
    ..registerLazySingleton<GetCharacterDetailsUseCase>(
      () => GetCharacterDetailsUseCase(rickAndMortyRepository),
    )
    ..registerLazySingleton<GetCharactersUseCase>(
      () => GetCharactersUseCase(rickAndMortyRepository),
    );
}
