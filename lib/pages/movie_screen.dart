import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/utils/clip_path.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({@required this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            transform: Matrix4.translationValues(0.0, -50, 0.0),
            child: Hero(
              tag: widget.movie.imageUrl,
              child: ClipShadowPath(
                clipper: CircularClipper(),
                shadow: Shadow(
                  blurRadius: 20,
                ),
                child: Image(
                  height: 400.0,
                  width: double.infinity,
                  image: AssetImage(widget.movie.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
