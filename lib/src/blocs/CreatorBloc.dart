import 'package:marvel_app/src/models/Creator.dart';
import 'package:marvel_app/src/models/CreatorsResponse.dart';
import '../resources/Repositori.dart';

import 'package:rxdart/rxdart.dart';

class CreatorBloc {
  final _repository = Repository();
  final _creatorsController = BehaviorSubject<List<Creator>>();

  Stream<List<Creator>> get seriesStream => this._creatorsController.stream;

  getCreatorsBySerie(String id) async {
    CreatorsResponse result = await _repository.getCreatorBySerie(id);

    List<Creator> creators = result.data.results;

    this._creatorsController.sink.add(creators);
  }

  dispose() {
    this._creatorsController.close();
  }
}

final creatorBloc = CreatorBloc();
