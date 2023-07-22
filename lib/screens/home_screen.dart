import 'package:flutter/material.dart';
import 'package:pelicula_app/providers/movies_provider.dart';
import 'package:pelicula_app/search/search_delegate.dart';
import 'package:pelicula_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context);
    final moviesPopulares = Provider.of<MovieProvider>(context);
    // print(moviesProvider.onDisplayMovies);
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                      context: context,
                      delegate: MovieSearchDelegate(),
                    ),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            //Listado horizontal de peliculas
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //slider de peliculas
            MovieSlider(
              movies: moviesPopulares.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        )));
  }
}
