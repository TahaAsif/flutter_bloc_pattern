
import 'package:flutter_bloc_pattern/model/gallery_images.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc_pattern/repository/repository.dart';

class ImagesBloc {
  Repository _repository = Repository();

  final _imagesFetcher = PublishSubject<List<GalleryImages>>();

  Observable<List<GalleryImages>> get images => _imagesFetcher.stream;

  fetchData() async {
    List<GalleryImages> response = await _repository.fetchData();
    _imagesFetcher.sink.add(response);
  }

  dispose() {
    _imagesFetcher.close();
  }
}

final imagesBloc = ImagesBloc();