import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/bloc/images_bloc.dart';
import 'package:flutter_bloc_pattern/model/gallery_images.dart';

import 'custom_single_gallery_image.dart';

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
        child: buildGallery(data),
      ),
    );
  }

  Widget buildGallery(List<GalleryImages> data) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("My Gallery"),),
          body: new Card(
            elevation: 10,
            child: new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate:
                      // crossAxisCount stands for number of columns you want for displaying
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 15),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomSingleGalleryImage(data[index]);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
