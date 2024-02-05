import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Review App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.redAccent,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
              
            },
          ),
        ],
      ),
      body: MovieList(),
    );
  }
}

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return MovieCard(
          movieTitle: 'Movie ${index + 1}',
          movieRating: 4.5,
        );
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final String movieTitle;
  final double movieRating;

  MovieCard({required this.movieTitle, required this.movieRating});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      child: ListTile(
        title: Text(movieTitle),
        subtitle: Text('Rating: $movieRating'),
        onTap: () {
          // Handle tapping on a movie card (e.g., navigate to movie details screen)
          // Add your navigation logic here
        },
      ),
    );
  }
}
