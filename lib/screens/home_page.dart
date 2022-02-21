import 'package:flutter/material.dart';
import 'package:purple/functions/functions.dart';
import 'package:purple/utils/dynamic_sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getLatestWallpapers();
    List colorList = [
      const Color(0xFF696969),
      const Color(0xFF30D5C8),
      const Color(0xFfC8A2C8),
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.pink,
      Colors.grey,
      Colors.black,
      Colors.brown
    ];
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
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getBox.heigthBox(context, spacing),
                searchBar(context),
                getBox.heigthBox(context, spacing),
                sideText(context, "Best of the month"),
                getBox.heigthBox(context, spacing),
                customList(context, 0.6, 0.4),
                getBox.heigthBox(context, spacing),
                sideText(context, "The color tone"),
                getBox.heigthBox(context, spacing),
                customList(context, 0.15, 0.15, providedValue: colorList),
                getBox.heigthBox(context, spacing),
                sideText(context, "Categories"),
                getBox.heigthBox(context, spacing),
                customGrid(context),
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

  customList(context, heigth, width, {providedValue = ""}) {
    return Container(
      margin: EdgeInsets.only(left: Sizes().width(context, 0.05)),
      height: Sizes().heigth(context, heigth),
      width: Sizes().width(context, 1),
      child: ListView.builder(
        itemCount: providedValue != "" ? providedValue.length : 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: Sizes().width(context, 0.03)),
            decoration: BoxDecoration(
                color:
                    providedValue != "" ? providedValue[index] : Colors.amber,
                borderRadius:
                    BorderRadius.circular(Sizes().width(context, 0.04))),
            height: Sizes().heigth(context, heigth),
            width: Sizes().width(context, width),
          );
        },
      ),
    );
  }

  customGrid(context) {
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
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius:
                  BorderRadius.circular(Sizes().width(context, 0.04))),
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
