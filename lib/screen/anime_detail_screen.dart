import 'package:flutter/material.dart';
import '../model/anime_model.dart';

class Anime_Detais_Screen extends StatefulWidget {
  Anime_Detais_Screen({super.key, required this.animedata});

  final Animemodel animedata;

  @override
  State<Anime_Detais_Screen> createState() => _Anime_Detais_ScreenState();
}

class _Anime_Detais_ScreenState extends State<Anime_Detais_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                    widget.animedata.images!['jpg']!.largeImageUrl.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'Title:-',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                width: 3,
              ),
              Text(widget.animedata.title.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
