part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

class SearchTitleChanged extends SearchMovieEvent {
  const SearchTitleChanged(this.search);

  final String search;
}

class SearchMovieSubmitted extends SearchMovieEvent {}
