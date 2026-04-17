import 'dart:ui';

import 'package:application/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Cette fonction construit un widget circulaire pour la section "Découvrez" de l'application.
    Widget buildDisCoverCircle({image, title}) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: PhysicalShape(
                color: Colors.white,
                shadowColor: Colors.black,
                clipBehavior: Clip.hardEdge,
                elevation: 3,
                clipper: ShapeBorderClipper(shape: CircleBorder()),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.0),
            Text(title, style: TextStyle(color: Color(0xffadafaf))),
          ],
        ),
      );
    }

    List<String> images = [
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
      "assets/images/4.jpg",
    ];

    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff6f6f6),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Color(0xff8275b3)),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              height: 30,
              width: 30,
              //PhysicalShape est utilisé pour créer une forme personnalisée avec une ombre.
              //Il prend un clipper qui définit la forme de découpe, une couleur pour la forme, une couleur d'ombre et une élévation pour l'ombre.
              //Dans ce cas, il est utilisé pour créer une icône circulaire avec une ombre.
              child: PhysicalShape(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 3,
                clipper: ShapeBorderClipper(shape: CircleBorder()),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: Color(0xff8275b3),
                ),
              ),
            ),
          ),
        ],
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  children: [
                    Text(
                      "Découvrez",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      "Trier Par",
                      style: TextStyle(color: Color(0xff8275b3)),
                    ),
                    Icon(Icons.arrow_drop_down, color: Color(0xff8275b3)),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              "Explorez les dernières tendances de la mode",
              style: TextStyle(color: Color(0xffa3a3a3)),
            ),
          ),

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildDisCoverCircle(
                  image: "assets/images/woman.jpg",
                  title: "Femme",
                ),
                buildDisCoverCircle(
                  image: "assets/images/men.jpg",
                  title: "Homme",
                ),
                buildDisCoverCircle(
                  image: "assets/images/kid.jpg",
                  title: "Enfant",
                ),
                buildDisCoverCircle(
                  image: "assets/images/shoes.jpeg",
                  title: "Chaussures",
                ),
                buildDisCoverCircle(
                  image: "assets/images/foot_wear.jpg",
                  title: "Sport",
                ),
                buildDisCoverCircle(
                  image: "assets/images/woman.jpg",
                  title: "Femme",
                ),
              ],
            ),
          ),

          //          Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Color(0xffb3a5de)),
                  hintText: "Rechercher...",
                  hintStyle: TextStyle(color: Color(0xffb3a5de)),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Container(
                    padding: EdgeInsets.all(7.0),
                    child: PhysicalShape(
                      color: Color(0xff8477bb),
                      shadowColor: Colors.black,
                      elevation: 3,
                      clipper: ShapeBorderClipper(shape: CircleBorder()),
                      child: Icon(Icons.sync_alt, color: Colors.white),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    height: index.isEven ? 250 : 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(images[index]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 7.0),
                              decoration: BoxDecoration(
                                color: Colors.white12.withOpacity(0.1),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Berrylush",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "\$120",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "casual cottonamger",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.white),
                                      Text(
                                        "4.5",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
