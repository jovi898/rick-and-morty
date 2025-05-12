import 'package:rick_and_morty/data/repositories/rick_and_morty/repository.dart';
import 'package:rick_and_morty/models/character/character.dart';

class GetCharacterDetailsUseCase {
  final RickAndMortyRepository repository;

  GetCharacterDetailsUseCase(this.repository);

  Future<Character> execute(int id) async {
    try{
      final response = await repository.getCharactersDetails(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}