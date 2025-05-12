import 'package:rick_and_morty/data/repositories/favorite_character.dart/repository.dart';
import 'package:rick_and_morty/data/sqlfite/favorite_characters/schema.dart';

class AddToFavoriteCharactersUseCase {
  final FavoriteCharactersRepository _repository;

  AddToFavoriteCharactersUseCase(this._repository);

  Future<void> execute(FavoriteCharacterModel character) async {
    try {
      await _repository.addFavoriteCharacter(character);
    } catch (e) {
      rethrow;
    }
  }
}