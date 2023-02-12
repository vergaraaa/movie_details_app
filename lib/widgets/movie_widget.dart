import 'package:flutter/material.dart';
//
import 'package:movie_details_app/models/models.dart';
import 'package:movie_details_app/screens/screens.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: _MovieTitle(
              title: 'Movie Title #',
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: _SeeDetails(),
          ),
        ],
      ),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _SeeDetails extends StatelessWidget {
  const _SeeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => MovieDetailScreen(
              movie: MovieModel.empty,
            ),
          ),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('See Details'),
          SizedBox(width: 5),
          Icon(Icons.arrow_forward_rounded)
        ],
      ),
    );
  }
}
