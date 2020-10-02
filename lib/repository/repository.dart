
import 'package:flutter_bloc_pattern/model/GalleryImages.dart';
import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<List<GalleryImages>> fetchData() => appApiProvider.fetchData();
}