// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_movie_bloc.dart';

enum SearchStatus {
  pure,
  inProgress,
  success,
  failure;

  String toJson() => name;

  static SearchStatus fromJson(String json) => values.byName(json);
}

class SearchMovieState extends Equatable {
  const SearchMovieState({
    this.movie = MovieModel.empty,
    this.history = const [],
    this.search = '',
    this.status = SearchStatus.pure,
    this.error = '',
  });

  final MovieModel movie;
  final List<MovieModel> history;
  final String search;
  final SearchStatus status;
  final String error;

  SearchMovieState copyWith({
    MovieModel? movie,
    List<MovieModel>? history,
    String? search,
    SearchStatus? status,
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'movie': movie.toJson(),
      'history': history.map((x) => x.toJson()).toList(),
      'search': search,
      'status': status.name,
      'error': error,
    };
  }

  factory SearchMovieState.fromJson(Map<String, dynamic> map) {
    return SearchMovieState(
      movie: MovieModel.fromJson(map['movie']),
      history: List<MovieModel>.from(
        (map['history']).map<MovieModel>(
          (x) => MovieModel.fromJson(x),
        ),
      ),
      search: map['search'] as String,
      status: SearchStatus.fromJson(map['status']),
      error: map['error'] as String,
    );
  }
}
