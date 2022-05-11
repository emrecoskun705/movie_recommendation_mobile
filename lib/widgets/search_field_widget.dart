import 'package:flutter/material.dart';
import 'package:movie_recommandation/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  Function(String)? onChanged;

  SearchFieldWidget({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        // height: 36,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                style: TextStyle(
                  color: Constants.kWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
