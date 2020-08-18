class Gif {
  String id;
  String sourceMain;
  int widthMain;
  int heightMain;
  String sourceDownsizedStill;
  int widthDownsizedStill;
  int heightDownsizedStill;
  bool isFavorite;

  Gif({
    this.id,
    this.sourceMain,
    this.widthMain,
    this.heightMain,
    this.sourceDownsizedStill,
    this.widthDownsizedStill,
    this.heightDownsizedStill,
    this.isFavorite,
  });

  factory Gif.fromJson(Map<String, dynamic> json) {
    int widthMain = int.tryParse(json['images']['original']['width']);
    int heightMain = int.tryParse(json['images']['original']['height']);
    int widthDownsizedStill =
        int.tryParse(json['images']['downsized_still']['width']);
    int heightDownsizedStill =
        int.tryParse(json['images']['downsized_still']['height']);

    return Gif(
        id: json['id'],
        sourceMain: json['images']['original']['url'],
        widthMain: widthMain != null ? widthMain : 250,
        heightMain: heightMain != null ? heightMain : 250,
        sourceDownsizedStill: json['images']['downsized_still']['url'],
        widthDownsizedStill:
            widthDownsizedStill != null ? widthDownsizedStill : 250,
        heightDownsizedStill:
            heightDownsizedStill != null ? heightDownsizedStill : 250,
        isFavorite: false);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sourceMain': sourceMain,
      'widthMain': widthMain,
      'heightMain': heightMain,
      'sourceDownsizedStill': sourceDownsizedStill,
      'widthDownsizedStill': widthDownsizedStill,
      'heightDownsizedStill': heightDownsizedStill,
      'isFavorite': isFavorite == true ? 1 : 0
    };
  }
}
