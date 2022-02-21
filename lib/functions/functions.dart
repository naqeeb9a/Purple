import 'dart:convert';

import 'package:http/http.dart' as http;

getLatestWallpapers() async {
  var response = await http.get(
    Uri.parse(
        "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&&order=latest"),
  );
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    return jsonData["hits"];
  } else if (response.statusCode == 500) {
    return "server";
  } else {
    return "internet";
  }
}
