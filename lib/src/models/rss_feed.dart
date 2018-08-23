class RssFeedResponse {
  RssFeed feed;

  RssFeedResponse(this.feed);

  RssFeedResponse.fromJson(Map<String, dynamic> parsedJson) {
    feed = RssFeed.fromJson(parsedJson['feed']);
  }
}

class RssFeed {
  List<RssSong> entries;

  RssFeed(this.entries);

  RssFeed.fromJson(Map<String, dynamic> parsedJson) {
    entries = [];
    List<dynamic> entryList = parsedJson['entry'];
    entryList.forEach((entry) {
      entries.add(RssSong.fromJson(entry));
    });
  }
}

class RssSong {
  String title;
  String imageURL;
  String collectionName;
  String releaseDate;
  String priceLabel;

  RssSong(this.title, this.imageURL, this.collectionName, this.releaseDate,
      this.priceLabel);

  RssSong.fromJson(Map<String, dynamic> parsedJson) {
    collectionName = parsedJson['im:collection']['im:name']['label'];
    priceLabel = parsedJson['im:price']['label'];
    releaseDate = parsedJson['im:releaseDate']['attributes']['label'];
    title = parsedJson['title']['label'];
    List<dynamic> imageList = parsedJson['im:image'];
    imageURL = imageList[1]['label'];
  }
}
