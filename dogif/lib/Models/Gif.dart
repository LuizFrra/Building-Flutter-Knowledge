class Gif {

  String id;
  String source;
  int width;
  int height;
  bool isFavorite;

  Gif({this.id, this.source, this.width, this.height, this.isFavorite});

  factory Gif.fromJson(Map<String, dynamic> json) {

//    int width = int.tryParse(json['dados']['image_width']);
//    if(width == null )
//      width = 0;
//
//    int height = int.tryParse(json['dados']['image_height']);
//    if(height == null )
//      height = 0;

    return Gif(
      id: json['id'],
      source: json['source'],
//      width: width,
//      height: height,
      isFavorite: false
    );
  }
}