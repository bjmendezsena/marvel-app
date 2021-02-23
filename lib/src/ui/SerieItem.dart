import 'package:marvel_app/src/models/Serie.dart';
import 'package:marvel_app/src/pages/screens/DetailsScreen.dart';
import 'package:marvel_app/src/ui/utils.dart';

import 'package:flutter/material.dart';

class SerieItem extends StatelessWidget {
  final Serie serie;

  const SerieItem({@required this.serie});

  @override
  Widget build(BuildContext context) {
    final urlImage = getImagePath(this.serie.thumbnail);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(this.serie.id.toString())));
      },
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: FittedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(urlImage,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : circularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: this.serie.title,
              style: Theme.of(context).textTheme.bodyText1
            ),
          ),
        ],
      ),
    );
  }
}
