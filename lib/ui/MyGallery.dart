import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/bloc/images_bloc.dart';
import 'package:flutter_bloc_pattern/model/GalleryImages.dart';

class MyGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    imagesBloc.fetchData();

    return StreamBuilder(
        stream: imagesBloc.images,
        builder: (context, AsyncSnapshot<List<GalleryImages>> snapshot) {
          if (snapshot.hasData) {
            return _buildImages(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildImages(List<GalleryImages> data) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: ListView.builder(
          itemBuilder: (_, index) => Text(data[index].title),
        ),
      ),
    );
  }
}
