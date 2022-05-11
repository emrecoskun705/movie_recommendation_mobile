class Movie {
  int? id;
  String? imgUrl;
  String? title;
  int? year;
  int? certificate;
  int? duration;
  String? genre;
  double? imdb;
  double? metascore;
  String? overview;
  String? director;
  String? actors;

  bool isSelected = false;

  Movie(
      {this.id,
      this.imgUrl,
      this.title,
      this.year,
      this.certificate,
      this.duration,
      this.genre,
      this.imdb,
      this.metascore,
      this.overview,
      this.director,
      this.actors});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['img_url'];
    title = json['title'];
    year = json['year'];
    certificate = json['certificate'];
    duration = json['duration'];
    genre = json['genre'];
    imdb = json['imdb'];
    metascore = json['metascore'];
    overview = json['overview'];
    director = json['director'];
    actors = json['actors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_url'] = this.imgUrl;
    data['title'] = this.title;
    data['year'] = this.year;
    data['certificate'] = this.certificate;
    data['duration'] = this.duration;
    data['genre'] = this.genre;
    data['imdb'] = this.imdb;
    data['metascore'] = this.metascore;
    data['overview'] = this.overview;
    data['director'] = this.director;
    data['actors'] = this.actors;
    return data;
  }
}
