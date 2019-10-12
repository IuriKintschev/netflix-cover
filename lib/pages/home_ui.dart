import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _moviesSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: Hero(
                  tag: movies[index].imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(movies[index].imageUrl),
                      height: 220.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 40,
            right: 30,
            child: Container(
              width: 250,
              child: Text(
                movies[index].title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/netflix_logo.png'),
        ),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(left: 30),
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
          iconSize: 30,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30),
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
            iconSize: 30,
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _moviesSelector(index);
              },
            ),
          ),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffd45253),
                        Color(0xff9e1f28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff9e1f28),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      labels[index].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
