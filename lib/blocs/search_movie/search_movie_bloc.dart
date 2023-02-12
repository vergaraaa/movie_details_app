import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
//
import 'package:movie_details_app/models/models.dart';
import 'package:movie_details_app/repositories/movies_repository.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
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

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final movie = await moviesRepository.getMovieDetail(state.search);

      emit(state.copyWith(
        movie: movie,
        status: FormzStatus.submissionSuccess,
        error: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        error: e.toString(),
      ));
    }
  }
}
