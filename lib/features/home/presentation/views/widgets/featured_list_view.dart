import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: index == 0 ? 0 : 12.0),
                      child: AspectRatio(
                        aspectRatio: 0.65,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://books.google.com/books/content?id=G6lHXQWOx6sC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: index == 0 ? 8 : 18),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white12,
                        radius: 23,
                        child: Icon(Icons.play_arrow, color: Colors.white, size: 16),
                      ).frosted(
                          blur: 3.0,
                          frostColor: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                    )
                  ],
                )),
      ),
    );
  }
}
