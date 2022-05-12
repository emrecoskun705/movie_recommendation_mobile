import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommandation/models/movie.dart';
import 'package:movie_recommandation/widgets/storyline.dart';

import '../constants.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kCyanColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: ListView(
                primary: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.network(
                            movie.imgUrl!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 260,
                              child: AutoSizeText(
                                movie.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Constants.kWhiteColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${movie.imdb!} ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Constants.kWhiteColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'IMDb',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Constants.kGreyColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 23,
                                ),
                                Icon(
                                  Icons.star,
                                  color: movie.imdb! >= 2
                                      ? Colors.yellowAccent
                                      : Constants.kGreyColor,
                                ),
                                Icon(
                                  Icons.star,
                                  color: movie.imdb! >= 4
                                      ? Colors.yellowAccent
                                      : Constants.kGreyColor,
                                ),
                                Icon(
                                  Icons.star,
                                  color: movie.imdb! >= 6
                                      ? Colors.yellowAccent
                                      : Constants.kGreyColor,
                                ),
                                Icon(
                                  Icons.star,
                                  color: movie.imdb! >= 8
                                      ? Colors.yellowAccent
                                      : Constants.kGreyColor,
                                ),
                                Icon(
                                  Icons.star,
                                  color: movie.imdb! == 10
                                      ? Colors.yellowAccent
                                      : Constants.kGreyColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  '${movie.genre!}',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Constants.kGreyColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                AutoSizeText(
                                  '${movie.duration!} min, ${movie.year!}',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Constants.kGreyColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Storyline('Story Line', movie.overview!),
                  Storyline('Director', movie.director!),
                  Storyline('Stars', (movie.actors!.split('\t').join("\n"))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
