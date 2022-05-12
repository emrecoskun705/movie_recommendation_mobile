import 'package:flutter/material.dart';
import 'package:movie_recommandation/constants.dart';

class Storyline extends StatelessWidget {
  Storyline(this.title, this.storyline);
  final String? storyline;
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Constants.kWhiteColor),
          ),
          SizedBox(height: 8.0),
          Text(
            storyline!,
            style: textTheme.bodyText2!.copyWith(
              color: Colors.white70,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
