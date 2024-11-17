import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Best Card',
      home: TheCardLayout(),
    );
  }
}

class TheCardLayout extends StatefulWidget {
  @override
  _TheCardLayoutState createState() => _TheCardLayoutState();
}

class _TheCardLayoutState extends State<TheCardLayout> {
  List<Map<String, String>> favoriteCards = [
    {'title': 'Card 1', 'description': 'This is the description for card 1'},
    {'title': 'Card 2', 'description': 'This is the description for card 2'},
    {'title': 'Card 3', 'description': 'This is the description for card 3'},
  ];

  List<bool> isFavorite = [false, false, false]; // Track favorite status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite App'),
        backgroundColor: Colors.lightBlue, // Set AppBar color to light blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favoriteCards.length,
                itemBuilder: (context, index) {
                  return FavoriteCard(
                    title: favoriteCards[index]['title']!,
                    description: favoriteCards[index]['description']!,
                    isFavorite: isFavorite[index],
                    onFavoriteToggle: () {
                      setState(() {
                        isFavorite[index] =
                            !isFavorite[index]; // Toggle favorite status
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const FavoriteCard({
    Key? key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // No border radius
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between title/description and icon
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(description),
                ],
              ),
            ),
            IconButton(
              onPressed: onFavoriteToggle,
              icon: Icon(
                Icons.favorite,
                color: isFavorite
                    ? Colors.red
                    : Colors.white, // Change color based on favorite status
              ),
            ),
          ],
        ),
      ),
    );
  }
}
