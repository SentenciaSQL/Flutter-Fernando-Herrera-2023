import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) { 
  final fethMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(fethMoreMovies: fethMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{

  int currentPage = 0;
  MovieCallback fethMoreMovies;
  
  MoviesNotifier({
    required this.fethMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fethMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }

}