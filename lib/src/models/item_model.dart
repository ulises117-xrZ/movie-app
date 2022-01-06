class ItemModel {
  String _title;
  String _year;
  String _rated;
  String _released;
  String _runtime;
  String _genre;
  String _director;
  String _writer;
  String _actors;
  String _plot;
  String _language;
  String _country;
  String _awards;
  String _poster;
  List<_Ratings> _ratings = [];
  String _metascore;
  String _imdbRating;
  String _imdbVotes;
  String _imdbid;
  String _dvd;
  String _boxoffice;
  String _type;

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['Ratings'].length);
    _title = parsedJson['Title'];
    _year = parsedJson['Year'];
    _rated = parsedJson['Rated'];
    _released = parsedJson['Released'];
    _runtime = parsedJson['Runtime'];
    _genre = parsedJson['Genre'];
    _director = parsedJson['Director'];
    _writer = parsedJson['Writer'];
    _actors = parsedJson['Actors'];
    _plot = parsedJson['Plot'];
    _language = parsedJson['Language'];
    _country = parsedJson['Country'];
    _awards = parsedJson['Awards'];
    _poster = parsedJson['Poster'];
    _metascore = parsedJson['Metascore'];
    _imdbRating = parsedJson['imdbRating'];
    _imdbVotes = parsedJson['imdbVotes'];
    _imdbid = parsedJson['imdbID'];
    _type = parsedJson['Type'];
    _dvd = parsedJson['DVD'];
    _boxoffice = parsedJson["BoxOffice"];
    List<_Ratings> temp = [];
    for (int i = 0; i < parsedJson['Ratings'].length; i++) {
      _Ratings rating = _Ratings(parsedJson['Ratings'][i]);
      temp.add(rating);
    }
  }
  List<_Ratings> get rating => _ratings;
  String get title => _title;
  String get year => _year;
  String get rated => _rated;
  String get released => _released;
  String get runtime => _runtime;
  String get genre => _genre;
  String get director => _director;
  String get writer => _writer;
  String get actors => _actors;
  String get plot => _plot;
  String get language => _language;
  String get country => _country;
  String get awards => _awards;
  String get poster => _poster;
  String get metascore => _metascore;
  String get imdbrating => _imdbRating;
  String get imdbvotes => _imdbVotes;
  String get type => _type;
  String get dvd => _dvd;
  String get box_office => _boxoffice;
  String get imdbid => _imdbid;
}

class _Ratings {
  // Map<String, dynamic> _ratings = {};
  String _source;
  String _value;

  _Ratings(rating) {
    _source = rating['Source'];
    _value = rating['Value'];
  }

  String get source => _source;
  String get value => _value;
}
