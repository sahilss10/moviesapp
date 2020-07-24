import 'package:flutter/material.dart';
import 'screens/movieappmain.dart';
import 'package:provider/provider.dart';
import 'package:moviesapp_flutter/classes/movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Movie>(
      create: (context) => Movie(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MoviesAppHome(),
      ),
    );
  }
}
