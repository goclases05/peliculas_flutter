// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromMap(jsonString);

import 'dart:convert';

class CreditsResponse {
    CreditsResponse({
      required  this.id,
      required  this.cast,
      required  this.crew,
    });

    int id;
    List<Cast> cast;
    List<Cast> crew;

    factory CreditsResponse.fromJson(String str) => CreditsResponse.fromMap(json.decode(str));


    factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
    );

}

class Cast {
    Cast({
      required  this.adult,
      required  this.gender,
      required  this.id,
      required  this.name,
      required  this.originalName,
      required  this.popularity,
        this.profilePath,
      required  this.castId,
      required  this.character,
      required  this.creditId,
      required  this.order,
        this.job,
    });

    bool adult;
    int gender;
    int id;
    String name;
    String originalName;
    double popularity;
    String? profilePath;
    int castId;
    String character;
    String creditId;
    int order;
    String? job;

    get fullProfilePath{
      if(this.profilePath != null){
        return 'https://image.tmdb.org/t/p/w500${this.profilePath}';
      }else{
        return 'https://w0.peakpx.com/wallpaper/312/405/HD-wallpaper-camera-icon.jpg';
      }
      
    }

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));


    factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"]==null?0:json["gender"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? 0 : json["cast_id"],
        character: json["character"] == null ? '' : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? 0 : json["order"],
        job: json["job"] == null ? null : json["job"],
    );

}