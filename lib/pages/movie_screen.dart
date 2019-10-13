import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/pages/content_scrool.dart';
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
          Stack(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  Image(
                    image: AssetImage('assets/netflix_logo.png'),
                    height: 60,
                    width: 150,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(right: 30),
                    onPressed: () => print("adicionado"),
                    icon: Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  iconSize: 35,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 20.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  color: Colors.black,
                  iconSize: 35,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_half,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Ano',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Pais',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.movie.country.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Duraçao',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${widget.movie.length.toString()} min',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  height: 120,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: 'Previa',
            imageH: 200,
            imageW: 250,
          ),
        ],
      ),
    );
  }
}
