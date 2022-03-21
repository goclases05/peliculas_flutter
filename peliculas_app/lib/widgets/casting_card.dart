import 'package:flutter/material.dart';
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/providers/moview_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int moviId;

  CastingCards(this.moviId);


  @override
  Widget build(BuildContext context) {

    final moviesProvider=Provider.of<MoviesProvider>(context,listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(moviId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot){

        if(!snapshot.hasData){
          return Container(
            margin:const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child:const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final cast=snapshot.data;
        
        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          //color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (BuildContext context,int index){
              return _CastCard();
            }
          ),
        );
      }
    );

    
  }
}

class _ {
}

class _CastCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.green,
      child:Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/150x300'),
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          SizedBox(height: 5,),
          const Text(
            'actor.name asdfasdf asdfasdf asdfasdf',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          )
        ],
      )
    );
  }
}