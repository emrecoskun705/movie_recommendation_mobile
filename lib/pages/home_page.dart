import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_recommandation/pages/recommend_page.dart';
import 'package:movie_recommandation/widgets/search_field_widget.dart';
import 'package:movie_recommandation/models/movie.dart';
import '../constants.dart';
import 'package:movie_recommandation/network/movie.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  bool isMoreThanThreeChars = false;

  List<int> favouriteMovieList = [];

  List<Movie> movieList = [];

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
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Please search and\nselect movies?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SearchFieldWidget(
                    onChanged: (text) async {
                      if (text.length == 3) {
                        movieList = await searchMovies(text);
                        setState(() {
                          isMoreThanThreeChars = true;
                        });
                      } else if (text.length < 3) {
                        setState(() {
                          isMoreThanThreeChars = false;
                        });
                      } else {
                        movieList = await searchMovies(text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 39,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Movies',
                          style: TextStyle(
                            color: Constants.kWhiteColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RecommendPage(favouriteMovieList)));
                          },
                          child: Text(
                            'Recommend Movies',
                            style: TextStyle(color: Constants.kGreyColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  isMoreThanThreeChars
                      ? (!isLoading
                          ? SizedBox(
                              height: 400,
                              child: ListView.builder(
                                itemCount: movieList.length,
                                itemBuilder: (ctx, idx) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    key: ValueKey(movieList[idx].id),
                                    leading:
                                        Image.network(movieList[idx].imgUrl!),
                                    title: Text(
                                      movieList[idx].title!,
                                      style: TextStyle(
                                        color: Constants.kWhiteColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Text(
                                        movieList[idx].genre!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Constants.kWhiteColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        if (!movieList[idx].isSelected) {
                                          movieList[idx].isSelected = true;
                                          if (!favouriteMovieList
                                              .contains(movieList[idx].id!)) {
                                            favouriteMovieList
                                                .add(movieList[idx].id!);
                                          }
                                        } else {
                                          movieList[idx].isSelected = false;
                                          favouriteMovieList
                                              .remove(movieList[idx].id!);
                                        }
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.star,
                                        color: favouriteMovieList
                                                .contains(movieList[idx].id!)
                                            ? Colors.yellowAccent
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitRing(
                                color: Colors.white,
                              )))
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
