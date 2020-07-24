import 'package:flutter/material.dart';
import 'package:moviesapp_flutter/classes/movie.dart' as models;

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(movie: movie);
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({this.movie});

  final models.Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.22,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 30, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.0,
                offset: Offset(
                  0.0, //horizontally
                  3.0, //vertically
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10, left: 30, right: 10),
              height: 155.0,
              width: 120.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                    offset: Offset(
                      0.0, //horizontally
                      9.0, //vertically
                    ),
                  ),
                ],
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: NetworkImage(this.movie.poster), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.movie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    this.movie.type,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //adding custom star ratings
                  Row(
                    children: <Widget>[
                      Text(
                        "8.5", //There were only few details provided in the api.. hence adding custom ratings
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.orange,
                        size: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
