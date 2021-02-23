import 'package:flutter/material.dart';
import 'package:marvel_app/src/models/Serie.dart';

import 'SerieItem.dart';

class SeriesList extends StatelessWidget {
  final List<Serie> serieList;
  final ScrollController controller;

  const SeriesList({@required this.serieList, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Expanded(
            child: GridView.builder(
                controller: this.controller,
                itemCount: this.serieList.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 60),
                itemBuilder: (BuildContext context, int index) {
                  return SerieItem(serie: this.serieList[index]);
                })),
      ]),
    );
  }
}
