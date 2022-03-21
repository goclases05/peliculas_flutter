import 'package:flutter/material.dart';
import 'package:peliculas_app/models/now_playing_response.dart';

class MovieSlider extends StatefulWidget {

  final String? title;
  final List<Movie> movies;

  final Function OnNexPage;
  

  const MovieSlider({Key? key,this.title,required this.movies,required this.OnNexPage,}) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController=new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {

      if(scrollController.position.pixels>=scrollController.position.maxScrollExtent-500){
        widget.OnNexPage();
      }

      print(scrollController.position.pixels);
      print(scrollController.position.maxScrollExtent);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          if(this.widget.title != null)
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20),
              child: Text(this.widget.title!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),

          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (BuildContext context,int index)=> _MoviePoster(movie:widget.movies[index]),
             
            ),
          )
           
        ]
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({ Key? key,required this.movie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 130,
      height: 190,
      //color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
           GestureDetector(
            onTap: ()=>Navigator.pushNamed(
              context, 
              'details',
              arguments: movie
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:
              
              FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterimg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
          
              
            ),
          ),
          const SizedBox(height:5),

          Text(movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ) ;
  }
}