import 'package:marvel_app/src/global/Environments.dart';
import 'package:marvel_app/src/models/CreatorsResponse.dart';
import 'package:marvel_app/src/models/SeriesResponse.dart';
import 'ApiService.dart';

class MarvelProvider {
  final String _seriesUrl = 'series';
  final String _creatorsUrl = 'series/{id}/creators';
  Future<SeriesResponse> fetchSerieList() async {
    String url = Environments.getMountedUrl(_seriesUrl);
    final response = await ApiService.invokeGet(url);

    if (response.statusCode == 200) {
      SeriesResponse seriesResponse = seriesResponseFromJson(response.body);

      return seriesResponse;
    }

    return throw Exception('Failed to load series');
  }

  Future<CreatorsResponse> fetchCreatorList(String id) async {
    String url =
        Environments.getMountedUrl(_creatorsUrl.replaceAll('{id}', id));
    final response = await ApiService.invokeGet(url);

    if (response.statusCode == 200) {
      CreatorsResponse creatorsResponse =
          creatorsResponseFromJson(response.body);

      return creatorsResponse;
    }

    return throw Exception('Failed to load creators');
  }
}
