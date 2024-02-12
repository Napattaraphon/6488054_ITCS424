import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String title;
  final int releaseYear;
  final String genre;
  final String synopsis;
  final double rating;
  final String imageUrl;

  MovieDetailPage({
    required this.title,
    required this.releaseYear,
    required this.genre,
    required this.synopsis,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffa90000),
                    Color(0xff38718e),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSectionTitle('Release Year'),
                  SizedBox(height: 8.0),
                  Text(
                    '$releaseYear',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  _buildSectionTitle('Genre'),
                  SizedBox(height: 8.0),
                  Text(
                    genre,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  _buildSectionTitle('Rating'),
                  SizedBox(height: 8.0),
                  Text(
                    '$rating',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  _buildSectionTitle('Synopsis'),
                  SizedBox(height: 8.0),
                  Text(
                    synopsis,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Color(0xff4b0101),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xffd4bebe),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Detail Page',
      theme: ThemeData.light(), // Change to light theme
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: EdgeInsets.all(14.0),
        children: <Widget>[
          _buildMovieItem(
            context,
            'The Godfather',
            'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
          ),
          _buildMovieItem(
            context,
            'Pulp Fiction',
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg',
          ),
          _buildMovieItem(
            context,
            'Forrest Gump',
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/xwKC31DufHro8lhbBI4KSrNLtmd.jpg',
          ),
          // Add more recommended movies here
        ],
      ),
    );
  }

  Widget _buildMovieItem(BuildContext context, String title, String imageUrl) {
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailPage(
                title: title,
                releaseYear: 1972, // Example release year
                genre: 'Crime', // Example genre
                synopsis: 'Example synopsis', // Example synopsis
                rating: 9.2, // Example rating
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
