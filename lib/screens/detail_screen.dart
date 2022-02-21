import 'package:flutter/material.dart';
import 'package:purple/functions/functions.dart';
import 'package:purple/screens/full_screen.dart';

import '../utils/dynamic_sizes.dart';

class DetailScreen extends StatelessWidget {
  final String category;
  const DetailScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          category,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getCategoryImages(category.toLowerCase()),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return customGridDetail(context, snapshot.data);
            } else {
              return const Text("Loading");
            }
          }),
    );
  }

  customGridDetail(context, snapshot) {
    return GridView.builder(
        itemCount: snapshot.length,
        padding: EdgeInsets.all(Sizes().width(context, 0.02)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Sizes().width(context, 0.03),
            crossAxisSpacing: Sizes().width(context, 0.03),
            childAspectRatio:
                Sizes().width(context, 0.4) / Sizes().width(context, 0.55)),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullScreen(
                          img: snapshot[index]["largeImageURL"],
                          id: snapshot[index]["id"].toString())));
            },
            child: Hero(
              tag: snapshot[index]["id"].toString(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.circular(Sizes().width(context, 0.04)),
                    image: DecorationImage(
                        image: NetworkImage(snapshot[index]["largeImageURL"]),
                        fit: BoxFit.cover)),
              ),
            ),
          );
        });
  }
}
