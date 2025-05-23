import 'package:rick_and_morty/models/character/character.dart';


class HomeState {
  bool isPending;
  List<Character> characters;
  List<int> favoriteCharacters;
  String? errorMessage;
  int currentPage;
  int totalPages;
  bool isAllLoaded;
  bool isLoadingMore;

  

  HomeState({
    required this.isPending, 
    required this.characters, 
    required this.favoriteCharacters,
    required this.currentPage,
    required this.totalPages,
    required this.isAllLoaded,
    required this.isLoadingMore,
    this.errorMessage, 
    });

  HomeState copyWith ({
    bool? isPending,
    bool? isAllLoaded,
    bool? isLoadingMore,
    int? currentPage,
    int? totalPages,
    List<Character>? characters,
    List<int>? favoriteCharacters,
    String? errorMessage,
    
  }) {
    return HomeState(
      isPending: isPending ?? this.isPending,
      characters: characters ?? this.characters,
      favoriteCharacters: favoriteCharacters ?? this.favoriteCharacters,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isAllLoaded: isAllLoaded ?? this.isAllLoaded,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}