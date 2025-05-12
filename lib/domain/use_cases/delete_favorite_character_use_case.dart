import 'package:rick_and_morty/data/repositories/favorite_character.dart/repository.dart';
import 'package:rick_and_morty/data/sqlfite/favorite_characters/schema.dart';


class DeleteFavoriteCharactersUseCase {
  final FavoriteCharactersRepository _repository;

  DeleteFavoriteCharactersUseCase(this._repository);

  Future<void> execute(FavoriteCharacterModel character) async {
    try {
      await _repository.deleteFavoriteCharacter(character);
    } catch (e) {
      rethrow;
    }
  }
}