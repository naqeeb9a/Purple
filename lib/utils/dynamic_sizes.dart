import 'package:flutter/widgets.dart';

class Sizes {
  heigth(context, dynamicSize) {
    return MediaQuery.of(context).size.width * dynamicSize;
  }

  width(context, dynamicSize) {
    return MediaQuery.of(context).size.width * dynamicSize;
  }
}

class Boxes {
  heigthBox(context, dynamicSize) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * dynamicSize,
    );
  }

  widthBox(context, dynamicSize) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * dynamicSize,
    );
  }
}
