import 'package:marvel_app/src/models/Serie.dart';
import 'package:marvel_app/src/models/SeriesResponse.dart';
import 'package:marvel_app/src/resources/Repositori.dart';

import 'package:rxdart/rxdart.dart';

class SeriesBloc {
  final _repository = Repository();
  final _seriesController = BehaviorSubject<List<Serie>>();

  Stream<List<Serie>> get seriesStream => this._seriesController.stream;

  getAllSeries() async {
    SeriesResponse result = await _repository.getAllSeries();
    List<Serie> series = result.data.results;
    this._seriesController.sink.add(series);
  }

  dispose() {
    this._seriesController.close();
  }
}

final seriesBloc = SeriesBloc();
