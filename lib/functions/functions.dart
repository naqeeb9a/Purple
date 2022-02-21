import 'package:http/http.dart' as http;

getLatestWallpapers() async {
  var response = await http.get(
    Uri.parse(
        "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&&order=latest"),
  );
}

