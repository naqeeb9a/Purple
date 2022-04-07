import 'package:flutter/material.dart';
import 'package:purple/screens/full_screen.dart';
import 'package:purple/widgets/loader.dart';

import '../utils/dynamic_sizes.dart';

class DetailScreen extends StatelessWidget {
  final String category;
  final Future<dynamic>? future;
  const DetailScreen({Key? key, required this.category, required this.future})
      : super(key: key);

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
          future: future,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return customGridDetail(context, snapshot.data);
            } else {
              return const Loader();
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
                      id: snapshot[index]["id"].toString(),
                      user: snapshot[index]["user"].toString(),
                      userImage: snapshot[index]["userImageURL"].toString(),
                      tags: snapshot[index]["tags"].toString()),
                ),
              );
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
