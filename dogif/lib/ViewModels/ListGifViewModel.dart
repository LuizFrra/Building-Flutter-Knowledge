import 'package:dogif/Models/Gif.dart';
import 'package:dogif/Services/GifService.dart';
import 'package:dogif/Services/IGifService.dart';
import 'package:dogif/ViewModels/GifViewModel.dart';

class ListGifViewModel {
  IGifService _gifService;

  int _offset;

  int _realOffSet;

  String _randomId;

  static ListGifViewModel _listGifViewModel;

  List<Gif> _fetchResult;

  bool _isFetching = false;

  factory ListGifViewModel() {
    if (_listGifViewModel == null) {
      print("Griando Instancia ListGifViewModel");
      _listGifViewModel =
          new ListGifViewModel._internal("", 30, new GifService());
    }
    return _listGifViewModel;
  }

  ListGifViewModel._internal(
      this._randomId, this._offset, IGifService gifService) {
    this._gifService = gifService;
    this._fetchResult = new List<Gif>();
    this._realOffSet = 0;
  }

  Future<List<GifViewModel>> fetchGifs(int limit) async {
    List<GifViewModel> gifs = new List<GifViewModel>();
    while (limit != 0) {
      if (this._fetchResult.length == 0 && !this._isFetching) {
        this._isFetching = true;
        this._offset += 10;
        this._fetchResult.addAll(
            await this._gifService.fetchGifs(_offset - 10, _randomId, 10));
        this._isFetching = false;
      }
      while (this._isFetching == true)
        await Future.delayed(const Duration(milliseconds: 250));
      Gif removedElement =
          this._fetchResult.isNotEmpty ? this._fetchResult.removeAt(0) : null;
      if (removedElement != null) {
        gifs.add(GifViewModel(removedElement));
        limit -= 1;
        this._realOffSet += 1;
      }
    }
    return gifs;
  }

  Future<bool> addToFavorite(GifViewModel gif) async {
    print("Adicionando Ao favorito.");
    await _gifService.add(gif.toGif());
    return Future.value(true);
  }

  bool removeFromFavorite(GifViewModel gif) {
    return true;
  }
}
