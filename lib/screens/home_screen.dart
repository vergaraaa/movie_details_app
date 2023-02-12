import 'package:flutter/material.dart';
//
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
      onChanged: (movie) {},
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
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(),
          ),
        ),
        onPressed: () {},
        child: const Text('Search movie'),
      ),
    );
  }
}
