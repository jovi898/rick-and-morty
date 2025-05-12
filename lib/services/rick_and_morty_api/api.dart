import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/models/character/character.dart';
import 'package:rick_and_morty/models/character_response/character_response.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RickAndMortyApiClient {
  factory RickAndMortyApiClient(Dio dio, {String baseUrl}) = _RickAndMortyApiClient;

  @GET('/character')
  Future<CharacterResponse> getCharacters(
    @Query('page') int page,
  );

  @GET('/character/{id}')
  Future<Character> getCharactersDetails(@Path('id') String id);
}
