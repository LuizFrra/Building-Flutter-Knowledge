import 'package:dogif/ViewModels/ListFavoriteGifsViewModel.dart';
import 'package:flutter/material.dart';

class FavoriteListIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.reorder,
              color: Colors.white,
            ),
            iconSize: 32.0,
          ),
          Positioned(
            left: 8,
            top: 8,
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              iconSize: 20.0,
              padding: const EdgeInsets.all(0.0),
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ListFavoriteGifsViewModel();
                    }
                ))
              },
            ),
          ),
        ],
      ),
    );
  }
}
