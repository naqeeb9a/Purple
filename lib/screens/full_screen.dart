import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  final String img, id;
  const FullScreen({Key? key, required this.img, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
