import 'package:rick_and_morty/data/repositories/rick_and_morty/repository.dart';
import 'package:rick_and_morty/models/character_response/character_response.dart';

class GetCharactersUseCase {
  final RickAndMortyRepository repository;

  GetCharactersUseCase(this.repository);

  Future<CharacterResponse> execute(int page) async {
    try{
      final response = await repository.getCharacters(page);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}