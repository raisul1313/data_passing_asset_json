class Movie {
  int? id;
  String? movieName;
  int? movieYear;
  String? movieDirector;
  String? movieDescription;
  String? imageUrl;

  Movie(
      {this.id,
        this.movieName,
        this.movieYear,
        this.movieDirector,
        this.movieDescription,
        this.imageUrl});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieName = json['movie_name'];
    movieYear = json['movie_year'];
    movieDirector = json['movie_director'];
    movieDescription = json['movie_description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['movie_name'] = this.movieName;
    data['movie_year'] = this.movieYear;
    data['movie_director'] = this.movieDirector;
    data['movie_description'] = this.movieDescription;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
