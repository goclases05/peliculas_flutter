
import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/moview_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:peliculas_app/models/now_playing_response.dart';

class HomeScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    final moviesprovider=Provider.of<MoviesProvider>(context);
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en Cines"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search_outlined))
        ],
      ),
      body:SingleChildScrollView(
        child:  Column(
          children: [
            //TODO: CardSwiper
             CardSwiper(movies: moviesprovider.onDisplayMovie),
            //Listado horizontal de peliculas
            MovieSlider(
              title:'Popular!',
              movies:moviesprovider.popularMovies,
              OnNexPage: ()=>moviesprovider.getPopularMovies(),
            )
            
          ],
        ),
      ),
    );
  }
}