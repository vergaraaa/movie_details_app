import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
//
import 'package:movie_details_app/models/models.dart';

class MoviesRepository {
  final String apiKey = dotenv.get('API_KEY');
  final String baseUrl = dotenv.get('BASE_URL');

  Future<MovieModel> getMovieDetail(String movieTitle) async {
    final url = Uri.parse('$baseUrl/?apikey=$apiKey&t=$movieTitle');

    final resp = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    final jsonResponse = jsonDecode(resp.body);

    if (jsonResponse['Response'] == 'True') {
      return movieModelFromJson(resp.body);
    } else {
      throw jsonDecode(resp.body)['Error'];
    }
  }
}
