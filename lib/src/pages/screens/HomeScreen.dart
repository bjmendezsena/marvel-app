import 'package:marvel_app/src/blocs/SeriesBloc.dart';
import 'package:marvel_app/src/models/Serie.dart';
import 'package:marvel_app/src/ui/SeriesList.dart';
import 'package:marvel_app/src/ui/utils.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller;
  List<Serie> list = [];

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      seriesBloc.getAllSeries();
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    seriesBloc.getAllSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Serie>>(
        stream: seriesBloc.seriesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            list = [...list, ...snapshot.data];
            return SeriesList(
              serieList: list,
              controller: _controller,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return circularProgressIndicator();
        });
  }
}
