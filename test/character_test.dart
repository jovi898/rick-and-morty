import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/models/character/character.dart';

void main() {
  test('Парсит species: "Humanoid" как CharacterSpecies.other', () {
    final json = {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Humanoid",  // Это значение должно быть преобразовано в `other`
      "type": "Human",
      "gender": "Male",
      "origin": {"name": "Earth", "url": ""},
      "location": {"name": "Citadel", "url": ""},
      "image": "image_url",
      "episode": ["e1", "e2"],
      "url": "url",
      "created": "2024-01-01T00:00:00Z"
    };

    final character = Character.fromJson(json);

    expect(character.species, CharacterSpecies.other);  // Проверка на правильный результат
  });
}
