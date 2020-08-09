import 'package:dogif/ViewModels/GifViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FullGifPage extends StatefulWidget {

  GifViewModel _gif;

  FullGifPage(this._gif);

  @override
  _FullGifPageState createState() => _FullGifPageState();
}

class _FullGifPageState extends State<FullGifPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            print('saindo');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: Image.network(
              widget._gif.sourceMain,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                if(loadingProgress == null)
                  return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null ?
                            loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes : null
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
