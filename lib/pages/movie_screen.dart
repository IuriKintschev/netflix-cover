import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';

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
    );
  }
}
