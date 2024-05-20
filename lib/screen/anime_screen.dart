import 'package:flutter/material.dart';
import 'package:getapi_using_provider/provider/anime_provider.dart';
import 'package:getapi_using_provider/screen/anime_detail_screen.dart';
import 'package:provider/provider.dart';


class Anime_Screen extends StatefulWidget {
  const Anime_Screen({super.key});

  @override
  State<Anime_Screen> createState() => _Anime_ScreenState();
}

class _Anime_ScreenState extends State<Anime_Screen> {
  @override
  void initState() {
    super.initState();
    getAnimeData();
  }

  void getAnimeData() async {
    final animeProvider = Provider.of<AnimeController>(context, listen: false);
    await animeProvider.getAnimeData();
    print('object ===========>${animeProvider}');
  }

  @override
  Widget build(BuildContext context) {
    final animeProvider = Provider.of<AnimeController>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Anime_Detais_Screen(
                              animedata: animeProvider.Listdata[index],
                            ),
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                animeProvider
                                    .Listdata[index].images!['jpg']!.imageUrl
                                    .toString(),
                              ),
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
                            Text(
                                animeProvider.Listdata[index].title.toString()),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
