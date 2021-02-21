import 'package:marvel_app/src/models/SeriesResponse.dart';
import 'package:marvel_app/src/resources/providers/MarvelProvider.dart';

class Repository {
  final _marvelProvider = MarvelProvider();

  Future<SeriesResponse> getAllSeries() => _marvelProvider.fetchSerieList();
}
