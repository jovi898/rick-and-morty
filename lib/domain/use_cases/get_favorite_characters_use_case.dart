import 'package:rick_and_morty/data/repositories/favorite_character.dart/repository.dart';
import 'package:rick_and_morty/data/sqlfite/favorite_characters/schema.dart';


class GetFavoriteCharactersUseCase {
  final FavoriteCharactersRepository _repository;

  GetFavoriteCharactersUseCase(this._repository);

  Future<List<FavoriteCharacterModel>> execute() async {
    try {
      return await _repository.getFavoriteCharacters();
    } catch (e) {
      rethrow;
    }
  }
}