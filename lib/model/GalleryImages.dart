class GalleryImages {
  final int albumId; 
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
   

  GalleryImages({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});


  factory GalleryImages.fromJson(Map<String, dynamic> json)=> GalleryImages(
      albumId: json['albumId'],
      id: json['id'],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"]
  );

}