import 'package:flutter/material.dart';
//
import 'package:movie_details_app/models/models.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CoverImage(posterUrl: movie.poster),
              const SizedBox(height: 20),
              _ReleaseDate(released: movie.released),
              const SizedBox(height: 20),
              _RottenTomatoesRating(ratings: movie.ratings),
              const SizedBox(height: 20),
              _Plot(plot: movie.plot),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({
    required this.posterUrl,
  });

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      posterUrl == ''
          ? 'https://greenknow.mx/wp-content/uploads/2021/04/image-placeholder-vertical.jpg'
          : posterUrl,
      height: 500,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _ReleaseDate extends StatelessWidget {
  const _ReleaseDate({
    required this.released,
  });

  final String released;

  @override
  Widget build(BuildContext context) {
    return _MovieDetail(
      title: 'Released Date',
      info: released,
    );
  }
}

class _RottenTomatoesRating extends StatelessWidget {
  const _RottenTomatoesRating({
    required this.ratings,
  });

  final List<Rating> ratings;

  @override
  Widget build(BuildContext context) {
    String value = '';

    for (var rating in ratings) {
      if (rating.source == 'Rotten Tomatoes') {
        value = rating.value;
      }
    }

    return _MovieDetail(
      title: 'Rotten Tomatoes Rating',
      info: value,
    );
  }
}

class _Plot extends StatelessWidget {
  const _Plot({required this.plot});

  final String plot;

  @override
  Widget build(BuildContext context) {
    return _MovieDetail(
      title: 'Plot',
      info: plot,
    );
  }
}

class _MovieDetail extends StatelessWidget {
  const _MovieDetail({
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          info,
        ),
      ],
    );
  }
}
