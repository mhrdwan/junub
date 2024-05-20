import 'package:flutter/material.dart';

class CardFeatured extends StatelessWidget {
  final String title;
  final String description;
  final Function() actionFunction;
  final double widthFactor;
  final IconData icon; // Parameter untuk menentukan lebar kartu

  const CardFeatured({
    Key? key,
    required this.title,
    required this.description,
    required this.actionFunction,
    this.widthFactor = 1.0, // Nilai default untuk widthFactor adalah 1.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          widthFactor, // Menentukan lebar kartu secara dinamis
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 24),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: actionFunction,
                child: Text('Action'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
