import 'package:dogif/ViewModels/GifViewModel.dart';
import 'package:dogif/Widgets/FavHeartButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FullGif extends StatefulWidget {

  GifViewModel gif;
  Function addToFav;

  FullGif(this.gif, this.addToFav);

  @override
  _FullGifState createState() => _FullGifState();
}

class _FullGifState extends State<FullGif> {

  void addToFav() {
    widget.addToFav(widget.gif);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Dialog(
            backgroundColor: Color(0x000000).withOpacity(0),
            child: Image.network(
              widget.gif.sourceMain,
              fit: BoxFit.scaleDown,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                            : null),
                  ),
                );
              },
            ),
          ),
          FavHeartButton(onTap: addToFav, isFav: false,)
        ],
      ),
    );;
  }
}
