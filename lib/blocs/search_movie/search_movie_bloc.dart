import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
//
import 'package:movie_details_app/models/models.dart';
import 'package:movie_details_app/repositories/movies_repository.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState>
    with HydratedMixin {
  SearchMovieBloc() : super(const SearchMovieState()) {
    on<SearchTitleChanged>(_onSearchTitleChanged);
    on<SearchMovieSubmitted>(_onSearchMovieSubmitted);
  }

  final moviesRepository = MoviesRepository();

  void _onSearchTitleChanged(
    SearchTitleChanged event,
    Emitter<SearchMovieState> emit,
  ) async {
    emit(state.copyWith(search: event.search));
  }

  void _onSearchMovieSubmitted(
    SearchMovieSubmitted event,
    Emitter<SearchMovieState> emit,
  ) async {
    if (state.search.isEmpty) return;

    emit(state.copyWith(status: SearchStatus.inProgress));

    try {
      final movie = await moviesRepository.getMovieDetail(state.search);
      List<MovieModel> history = state.history;

      // check if movie is already in history
      int? index;
      for (int i = 0; i < history.length; i++) {
        if (movie.imdbId == history[i].imdbId) {
          index = i;
          break;
        }
      }

      if (index != null) {
        history.removeAt(index);
        history.insert(0, movie);
      } else {
        history = List.of(state.history)..insert(0, movie);
      }

      emit(state.copyWith(
        movie: movie,
        history: history,
        status: SearchStatus.success,
        error: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SearchStatus.failure,
        error: e.toString(),
      ));
    }
  }

  @override
  SearchMovieState? fromJson(Map<String, dynamic> json) {
    return SearchMovieState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SearchMovieState state) {
    return state.toJson();
  }
}
