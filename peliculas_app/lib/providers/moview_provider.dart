import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/models/now_playing_response.dart';
import 'package:peliculas_app/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier{

  String _ipKey='54fad71b057c2905ed2ce88b564162f6';
  String _baseUrl='api.themoviedb.org';
  String _leng='es-ES';

  List<Movie>onDisplayMovie=[];
  List<Movie>popularMovies=[];

  Map<int,List<Cast>> moviesCast={};

  int _popular_page=0;

  MoviesProvider(){
    print('movies provider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint,[int page=1]) async{
    var Url=Uri.https(_baseUrl,endPoint,{
        'api_key': _ipKey,
        'lenguage': _leng,
        'page':'$page'
      }
    );
    final response =await http.get(Url);
    return response.body;

  }

  getPopularMovies() async{
    final jsonData=await _getJsonData('3/movie/popular');
    final popularResponse=PopularResponse.fromJson(jsonData);

    popularMovies=[...popularMovies,...popularResponse.results];
    notifyListeners();
    print(popularMovies[0]);

  }

  getOnDisplayMovies() async{
    _popular_page++;
    final jsonData=await _getJsonData('3/movie/now_playing',_popular_page);
    final nowResponse=nowPlayingResponseFromJson(jsonData);

    onDisplayMovie=nowResponse.results;
    notifyListeners();
    //final decodeData=json.decode(response.body) as Map<String,dynamic>;

    
  }

  Future<List<Cast>> getMovieCast(int moviId) async{

    //TODO:revisar el mapa
      final jsonData=await _getJsonData('3/movie/$moviId/credits');
      final creditsResponse= CreditsResponse.fromJson(jsonData);

      moviesCast[moviId]=creditsResponse.cast;

      print('Pidiendo info');
      return creditsResponse.cast; 

  }

}