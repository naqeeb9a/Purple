import 'package:flutter/material.dart';
import 'package:purple/data/data.dart';
import 'package:purple/functions/functions.dart';
import 'package:purple/screens/detail_screen.dart';
import 'package:purple/screens/full_screen.dart';
import 'package:purple/utils/dynamic_sizes.dart';
import 'package:purple/widgets/loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Boxes getBox = Boxes();
    var spacing = 0.04;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4a0066),
            Color(0xff8c54a1),
          ],
        ),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            flexibleSpace: SafeArea(
              child: Center(
                child: searchBar(context),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getBox.heigthBox(context, spacing),
                sideText(context, "Latest"),
                getBox.heigthBox(context, spacing),
                SizedBox(
                  height: 220.0,
                  child: FutureBuilder(
                      future: GetWallpapers().getLatestWallpapers(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data == false) {
                            return const Text("no Internet");
                          } else {
                            return customList(context, 220.0, 150.0,
                                snapshot: snapshot.data);
                          }
                        } else {
                          return const Loader();
                        }
                      }),
                ),
                getBox.heigthBox(context, spacing),
                sideText(context, "The color tone"),
                getBox.heigthBox(context, spacing),
                customList(context, 50.0, 50.0, providedValue: colorList),
                getBox.heigthBox(context, spacing),
                sideText(context, "Categories"),
                getBox.heigthBox(context, spacing),
                customGrid(context, categoriesList),
                getBox.heigthBox(context, spacing),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sideText(context, text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Sizes().width(context, 0.04)),
      ),
    );
  }

  customList(context, heigth, width, {providedValue = "", snapshot = ""}) {
    return Container(
      margin: EdgeInsets.only(left: Sizes().width(context, 0.05)),
      height: heigth,
      width: Sizes().width(context, 1),
      child: ListView.builder(
        itemCount: providedValue != ""
            ? providedValue.length
            : snapshot != ""
                ? snapshot.length
                : 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (snapshot != "") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullScreen(
                            img: snapshot[index]["largeImageURL"].toString(),
                            id: snapshot[index]["id"].toString(),
                            user: snapshot[index]["user"].toString(),
                            userImage:
                                snapshot[index]["userImageURL"].toString(),
                            tags: snapshot[index]["tags"].toString())));
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      future: GetWallpapers()
                          .getColorImages(providedValue[index]["name"]),
                      category:
                          providedValue[index]["name"].toString().toUpperCase(),
                    ),
                  ),
                );
              }
            },
            child: Hero(
              tag: snapshot != "" ? snapshot[index]["id"].toString() : index,
              child: Container(
                margin: EdgeInsets.only(right: Sizes().width(context, 0.03)),
                decoration: BoxDecoration(
                    image: snapshot != ""
                        ? DecorationImage(
                            image:
                                NetworkImage(snapshot[index]["largeImageURL"]),
                            fit: BoxFit.cover)
                        : null,
                    color: providedValue != ""
                        ? providedValue[index]["color"]
                        : Colors.white,
                    borderRadius:
                        BorderRadius.circular(Sizes().width(context, 0.04))),
                height: heigth,
                width: width,
              ),
            ),
          );
        },
      ),
    );
  }

  customGrid(context, categoryList) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: Sizes().width(context, 0.03),
          crossAxisSpacing: Sizes().width(context, 0.03),
          childAspectRatio:
              Sizes().width(context, 0.5) / Sizes().width(context, 0.3)),
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  category: categoryList[index]["value"],
                  future: GetWallpapers().getCategoryImages(
                      categoryList[index]["value"].toLowerCase()),
                ),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken),
                    image: NetworkImage(categoryList[index]["img"]),
                    fit: BoxFit.cover),
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(Sizes().width(context, 0.04))),
            child: Text(
              categoryList[index]["value"],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  searchBar(context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(Sizes().width(context, 0.02))),
      margin: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      padding: EdgeInsets.symmetric(horizontal: Sizes().width(context, 0.05)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Find Wallpapers",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          const Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
