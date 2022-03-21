import 'package:flutter/material.dart';
import 'package:peliculas_app/models/now_playing_response.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    //TODO: cambiar luego por instancia de movie
    final Movie movie=ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        
        slivers: [
          _CustomAppbar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(
                voteAvarage:movie.voteAverage.toString(),
                post: movie.fullPosterimg,
                title: movie.title,
                originaltitle:movie.originalTitle
              ),
              _Overview(cont: movie.overview),
              CastingCards(movie.id)
            ])
          ),
        ]
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {

  final Movie movie;

  const _CustomAppbar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
         titlePadding: EdgeInsets.all(0),
         centerTitle:true ,
         title: Container(
           padding: EdgeInsets.only(bottom: 5),
           color: Colors.black12,
           alignment: Alignment.bottomCenter,
           width: double.infinity,
           child: Text(movie.title,style: TextStyle(fontSize: 16)),
         ),
         background: FadeInImage(
           placeholder: AssetImage('assets/loading.gif'), 
           image: NetworkImage(movie.fullbackdrop),
           fit: BoxFit.cover,
          ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final String title,originaltitle,post,voteAvarage;

  const _PosterAndTitle({required this.title,required this.originaltitle,required this.post,required this.voteAvarage});
  
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme=Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: 
              FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(post),
                fit:BoxFit.cover,
                height: 150,
              ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text(title,style:textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
              Text(originaltitle,style:textTheme.subtitle1,overflow: TextOverflow.ellipsis,maxLines: 1,),

              Row(
                children:[
                  const Icon(Icons.star,size: 20,color: Colors.grey,),
                  SizedBox(width: 5),
                  Text(voteAvarage,style:textTheme.caption)
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}

class _Overview  extends StatelessWidget {

  final String cont;
  _Overview({required this.cont});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text(cont
      ,textAlign: TextAlign.justify,style: Theme.of(context).textTheme.subtitle1
      )
      );
  }
}