import 'package:flutter/material.dart';
import 'package:moviesapp_flutter/widgets/movielistview.dart';
import 'package:moviesapp_flutter/services/moviejson.dart';
import 'package:moviesapp_flutter/classes/movie.dart';
import 'package:flutter/services.dart';

class MoviesAppHome extends StatefulWidget {
  @override
  MoviesAppHomeState createState() => MoviesAppHomeState();
}

class MoviesAppHomeState extends State<MoviesAppHome> {
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 28.0, left: 10.0, right: 10.0, bottom: 10.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Row(children: <Widget>[
              Flexible(
                child: TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search Movies',
                onPressed: () {
                  setState(() {
                    searchText = searchTextController.text;
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                },
              ),
            ]),
          ),
          if (searchText.length > 0)
            FutureBuilder<List<Movie>>(
                future: searchMovies(searchText),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: MovieList(
                        movies: snapshot.data,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }),
        ],
      ),
    );
  }
}
