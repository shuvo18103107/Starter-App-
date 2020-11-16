import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(Startup());
}

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      title: 'StartUp Name Generator App',
      home: Randomwords(),
    );
  }
}

class Randomwords extends StatefulWidget {
  @override
  _RandomwordsState createState() => _RandomwordsState();
}

class _RandomwordsState extends State<Randomwords> {
  final _suggestions = <WordPair>[];
  final _saved =
      Set<WordPair>(); //Set stores the word pairings that the user favorited.

  final _biggerFont = TextStyle(fontSize: 18.0);

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final tiles = _saved.map(
          (WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      },
    ));
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(
        pair); //alreadySaved check to ensure that a word pairing has not already been added to favorites.means still user not tap on this word
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        // NEW from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(
                pair); // user already save kore rakhce abar tap korle save variable theke oita remove
          } else {
            _saved.add(
                pair); //user choose korlo magar eita save variable set e nai
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/
          //print(i);

          final index = i ~/ 2; /*3*/

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
            /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StartUp App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
