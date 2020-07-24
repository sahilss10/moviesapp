import 'package:flutter/material.dart';
import 'package:moviesapp_flutter/widgets/moviewidgets.dart';
import 'package:moviesapp_flutter/classes/movie.dart';

class MovieList extends StatefulWidget {
  final List<Movie> movies;
  final Function itemClick;

  MovieList({this.movies, this.itemClick});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: this.widget.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: MovieItem(movie: this.widget.movies[index]),
              onTap: () => this.widget.itemClick(this.widget.movies[index]));
        },
      ),
    );
  }
}
