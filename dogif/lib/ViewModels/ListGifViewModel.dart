import 'package:dogif/Services/GifService.dart';
import 'package:dogif/Services/IGifService.dart';
import 'package:dogif/ViewModels/GifViewModel.dart';
import 'package:flutter/material.dart';

class ListGifViewModel extends ChangeNotifier  {

  List<GifViewModel> gifs = List<GifViewModel>();

  IGifService _gifService;

  int offset = 0;

  String randomId;

  static ListGifViewModel _listGifViewModel;

  factory ListGifViewModel() {
    if(_listGifViewModel == null) {
      print("Griando Instancia ListGifViewModel");
      _listGifViewModel = new ListGifViewModel._internal("", 0, new GifService());
    }
    return _listGifViewModel;
  }

  ListGifViewModel._internal(this.randomId, this.offset, IGifService gifService) {
    this._gifService = gifService;
  }


  Future<void> fetchGifs({limit = 5}) async {
    final fetchResult = await this._gifService.fetchGifs(offset, randomId);
    this.offset += this.offset;
    fetchResult.map((item) => gifs.add(GifViewModel(item)));
    notifyListeners();
  }

  bool addToFavorite(String id) {

  }

  bool removeFromFavorite(String id) {

  }

}