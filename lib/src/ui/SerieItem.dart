import 'package:flutter/material.dart';
import 'package:marvel_app/src/models/Serie.dart';
import 'package:marvel_app/src/ui/utils.dart';

class SerieItem extends StatelessWidget {
  final Serie serie;

  const SerieItem({@required this.serie});

  @override
  Widget build(BuildContext context) {
    final portrait = 'portrait_uncanny';
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: FittedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                '${this.serie.thumbnail.path}/${portrait}.${this.serie.thumbnail.extension}',
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : circularProgressIndicator();
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(this.serie.title, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
