import 'package:flutter/material.dart';
//
import 'package:movie_details_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomeScreen(),
};
