part of 'search_movie_bloc.dart';

class SearchMovieState extends Equatable {
  const SearchMovieState({
    this.movie = MovieModel.empty,
    this.history = const [],
    this.search = '',
    this.status = FormzStatus.pure,
    this.error = '',
  });

  final MovieModel movie;
  final List<MovieModel> history;
  final String search;
  final FormzStatus status;
  final String error;

  SearchMovieState copyWith({
    MovieModel? movie,
    List<MovieModel>? history,
    String? search,
    FormzStatus? status,
    String? error,
  }) {
    return SearchMovieState(
      movie: movie ?? this.movie,
      history: history ?? this.history,
      search: search ?? this.search,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        movie,
        history,
        search,
        status,
        error,
      ];
}
