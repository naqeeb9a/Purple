import 'dart:convert';

import 'package:http/http.dart' as http;

class GetWallpapers {
  getLatestWallpapers() async {
    var response = await http.get(
      Uri.parse(
          "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&&order=latest&safesearch=true&orientation=horizontal"),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData["hits"];
    } else if (response.statusCode == 500) {
      return "server";
    } else if (response.statusCode == 429) {
      return "limit exceeded";
    } else {
      return "internet";
    }
  }

  getCategoryImages(query, {page = 1}) async {
    var response = await http.get(
      Uri.parse(
          "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&&category=$query&per_page=200&safesearch=true&orientation=horizontal&page=$page"),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData["hits"];
    } else if (response.statusCode == 500) {
      return "server";
    } else if (response.statusCode == 429) {
      return "limit exceeded";
    } else {
      return "internet";
    }
  }

  getColorImages(color, {page = 1}) async {
    var response = await http.get(
      Uri.parse(
          "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&colors=$color&page=$page&per_page=200"),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData["hits"];
    } else if (response.statusCode == 500) {
      return "server";
    } else if (response.statusCode == 429) {
      return "limit exceeded";
    } else {
      return "internet";
    }
  }
}
