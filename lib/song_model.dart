import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Songs {
  final String name;
  final String location;
  final String description;
  final String imageUrl;

  int rating = 10;

  Songs({this.name, this.location, this.description, this.imageUrl});

  /* Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  } */
}
