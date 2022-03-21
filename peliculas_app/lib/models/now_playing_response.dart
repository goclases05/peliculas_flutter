// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromJson(jsonString);

import 'dart:convert';

NowPlayingResponse nowPlayingResponseFromJson(String str) => NowPlayingResponse.fromJson(json.decode(str));

//String nowPlayingResponseToJson(NowPlayingResponse data) => json.encode(data.toJson());

class NowPlayingResponse {
    NowPlayingResponse({
      required  this.page,
      required  this.results,
      required  this.totalPages,
      required  this.totalResults,
    });


    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory NowPlayingResponse.fromJson(Map<String, dynamic> json) => NowPlayingResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}



class Movie {
    Movie({
      required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
    });

    bool adult;
    String backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;
    DateTime releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    get fullPosterimg{
      if(this.posterPath != null){
        return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
      }else{
        return 'https://w0.peakpx.com/wallpaper/312/405/HD-wallpaper-camera-icon.jpg';
      }
      
    }

    get fullbackdrop{
      if(this.posterPath != null){
        return 'https://image.tmdb.org/t/p/w500${this.backdropPath}';
      }else{
        return 'https://w0.peakpx.com/wallpaper/312/405/HD-wallpaper-camera-icon.jpg';
      }
      
    }
    
    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
