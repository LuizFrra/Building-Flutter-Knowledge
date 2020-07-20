import 'package:dogif/Models/Gif.dart';

class GifViewModel {
  final Gif _gif;

  GifViewModel(this._gif);

  String get id {
      return this._gif.id;
  }

  String get source {
    return this._gif.source;
  }

  int get height {
    return this._gif.height;
  }

  int get width {
    return this._gif.width;
  }

  bool get isFavorite {
    return this._gif.isFavorite;
  }

  void set isFavorite(bool value) {
    this._gif.isFavorite = value;
  }
}