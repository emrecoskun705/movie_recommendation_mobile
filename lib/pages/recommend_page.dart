import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_recommandation/models/movie.dart';
import 'package:movie_recommandation/network/movie.dart';

import '../constants.dart';

class RecommendPage extends StatefulWidget {
  final List<int> movieIdList = [1, 2];

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  List<Movie> movieList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      for (var id in widget.movieIdList) {
        movieList.addAll(await recommendMovies(id));
      }
      setState(() {});
    });
  }

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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  primary: true,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Recommended movies\nfrom favourite films',
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
                    SizedBox(
                      height: 550,
                      child: ListView.builder(
                        itemCount: movieList.length,
                        itemBuilder: (ctx, idx) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: ListTile(
                              key: ValueKey(movieList[idx].id),
                              leading: Image.network(movieList[idx].imgUrl!),
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
                                  movieList[idx].overview!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Constants.kGreyColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  Icon(Icons.star, color: Colors.yellowAccent),
                                  Text(
                                    '${movieList[idx].imdb!}',
                                    style:
                                        TextStyle(color: Constants.kWhiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
