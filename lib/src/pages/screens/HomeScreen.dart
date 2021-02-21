import 'package:flutter/material.dart';
import 'package:marvel_app/src/blocs/SeriesBloc.dart';
import 'package:marvel_app/src/models/Serie.dart';
import 'package:marvel_app/src/ui/SeriesList.dart';
import 'package:marvel_app/src/ui/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('Llegó al fondo');
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    bloc.getAllSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Serie>>(
        stream: bloc.seriesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SeriesList(
              serieList: snapshot.data,
              controller: _controller,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return circularProgressIndicator();
        });
  }
}
