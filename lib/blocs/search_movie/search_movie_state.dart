part of 'search_movie_bloc.dart';

class SearchMovieState extends Equatable {
  const SearchMovieState({
    this.movie = MovieModel.empty,
    this.search = '',
    this.status = FormzStatus.pure,
    this.error = '',
  });

  final MovieModel movie;
  final String search;
  final FormzStatus status;
  final String error;

  SearchMovieState copyWith({
    MovieModel? movie,
    String? search,
    FormzStatus? status,
    String? error,
  }) {
    return SearchMovieState(
      movie: movie ?? this.movie,
      search: search ?? this.search,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        movie,
        search,
        status,
        error,
      ];
}
