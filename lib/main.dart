import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//
import 'package:movie_details_app/blocs/blocs.dart';
import 'package:movie_details_app/routes/routes.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final searchMovieBloc = SearchMovieBloc();

  @override
  void dispose() {
    super.dispose();
    searchMovieBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => searchMovieBloc,
        ),
      ],
      child: MaterialApp(
        title: 'Movie Details App',
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
        initialRoute: 'home',
      ),
    );
  }
}
