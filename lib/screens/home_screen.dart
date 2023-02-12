import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
//
import 'package:movie_details_app/blocs/blocs.dart';
import 'package:movie_details_app/screens/screens.dart';
import 'package:movie_details_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOVIE DETAILS APP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<SearchMovieBloc, SearchMovieState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status.isSubmissionSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => MovieDetailScreen(
                    movie: state.movie,
                  ),
                ),
              );
            } else if (state.status.isSubmissionFailure) {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text('Error'),
                    content: Text(state.error),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Column(
            children: const [
              _InstructionsText(),
              SizedBox(height: 20),
              _SearchTextField(),
              SizedBox(height: 20),
              _HistoryText(),
              SizedBox(height: 20),
              Expanded(child: _History()),
              SizedBox(height: 20),
              _SearchMovieButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _InstructionsText extends StatelessWidget {
  const _InstructionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Place the name of the movie you want to know its details here',
      textAlign: TextAlign.center,
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        suffixIcon: Icon(
          Icons.search,
        ),
      ),
      onChanged: (search) =>
          context.read<SearchMovieBloc>().add(SearchTitleChanged(search)),
    );
  }
}

class _HistoryText extends StatelessWidget {
  const _HistoryText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Search History',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _History extends StatelessWidget {
  const _History({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => MovieWidget(),
      itemCount: 10,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}

class _SearchMovieButton extends StatelessWidget {
  const _SearchMovieButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(),
              ),
            ),
            onPressed: () =>
                context.read<SearchMovieBloc>().add(SearchMovieSubmitted()),
            child: const Text('Search movie'),
          ),
        );
      },
    );
  }
}
