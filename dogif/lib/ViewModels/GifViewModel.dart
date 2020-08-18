import 'package:dogif/Models/Gif.dart';

class GifViewModel {
  final Gif _gif;

  GifViewModel(this._gif);

  String get id {
      return this._gif.id;
  }

  String get sourceMain {
    return this._gif.sourceMain;
  }

  String get sourceDownsizedStill {
    return this._gif.sourceDownsizedStill;
  }

  int get heightMain {
    return this._gif.heightMain;
  }

  int get widthMain {
    return this._gif.widthMain;
  }

  int get heightDownsizedStill {
    return this._gif.heightDownsizedStill;
  }

  int get widthDownsizedStill {
    return this._gif.widthDownsizedStill;
  }

  bool get isFavorite {
    return this._gif.isFavorite;
  }

  set isFavorite(bool value) {
    this._gif.isFavorite = value;
  }

  Gif toGif() => _gif;
}