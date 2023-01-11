

class UserModel {
late Feed feed;

  UserModel({required this.feed});

  UserModel.fromJson(Map<String, dynamic> json) {
    feed = (json['feed'] != null ? new Feed.fromJson(json['feed']) : null)!;
  }


}

class Feed {

 late List<Results> results;

  Feed(
      {
        required this.results});

  Feed.fromJson(Map<String, dynamic> json) {

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }


}



class Results {

late  String name;


  Results(
      {
        required this.name,
        });

  Results.fromJson(Map<String, dynamic> json) {

    name = json['name'];


  }


}

