import 'dart:convert';

class URL {
  /*
  API Response example
   {
      "alias": "13460",
      "_links": {
          "self": "https://www.youtube.com/watch?v=9240juCrcyo&list=WL&index=11&t=4s",
          "short": "https://url-shortener-nu.herokuapp.com/short/13460"
      }
    }
  */

  final String alias;
  final String originalURL;
  final String shortenedURL;

  URL(
    this.alias,
    this.originalURL,
    this.shortenedURL,
  );

  factory URL.fromJson(Map<String, dynamic> data) {
    return jsonDecode(data.toString());
  }

  String toJsonString(URL url) {
    return jsonEncode(url);
  }
}
