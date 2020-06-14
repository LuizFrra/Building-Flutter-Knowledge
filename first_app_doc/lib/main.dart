import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "This is the title of the App",
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    print("dupa scaffold");
    return new Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    print("dupa listview");
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return new Divider();
        }
        final int index = i ~/ 2;
        print(i);
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    print ("build row");
    print(wordPair.toString());
    return MyListTile(wordPair, _saved.contains(wordPair), () {
      print("$wordPair is saved ${_saved.contains(wordPair)}");
      final isSaved = _saved.contains(wordPair);
      isSaved ? _saved.remove(wordPair) : _saved.add(wordPair);
    });
  }
}

class MyListTile extends StatefulWidget {

  //final MyListTileState _state;
  final WordPair pair;
  final bool isSaved;
  final Function stateChangeOnTap;
  
  MyListTile(this.pair, this.isSaved, this.stateChangeOnTap);

  @override
  State<StatefulWidget> createState() => new MyListTileState(pair, isSaved, stateChangeOnTap);
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();

}

class MyListTileState extends State<MyListTile> {

  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  WordPair wordPair;
  bool isSaved;
  Function stateChangeOnTap;


  MyListTileState(this.wordPair, this.isSaved, this.stateChangeOnTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        isSaved = !isSaved;
        setState(stateChangeOnTap);
      },
    );
  }
}