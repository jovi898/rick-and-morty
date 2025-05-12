 import 'package:rick_and_morty/models/character/character.dart';

 
 class CharacterResponse {
  final List<Character> results;
  final CharacterResponseInfo info;

  CharacterResponse({
    required this.info,
    required this.results
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
         CharacterResponse(
      info: CharacterResponseInfo.fromJson(
        json['info'] as Map<String, dynamic>,
      ),
      results:
          (json['results'] as List<dynamic>)
              .map((e) => Character.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

 }

 class CharacterResponseInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterResponseInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory CharacterResponseInfo.fromJson(Map<String, dynamic> json) =>
     CharacterResponseInfo(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

 }
