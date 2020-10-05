import 'package:flutter_bloc_pattern/model/gallery_images.dart';
import '../service_handler/service_handler.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<List<GalleryImages>> fetchData() => appApiProvider.fetchData();
}