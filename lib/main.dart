import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:validators/validators.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff2c89ac), Color(0xff2c70ac)],
                    stops: [0.2, 0.8])),
            child: Column(
              children: [
                DrawerHeader(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: ExactAssetImage('img/plage.jpg'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'text',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),

        body: Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff2c89ac), Color(0xff2c70ac)],
                      stops: [0.2, 0.8])),
              child: _ListView(),
              constraints: BoxConstraints.expand(),
            )
        )
    );
  }
}

class _ListView extends StatefulWidget {
  @override
  __ListViewState createState() => __ListViewState();
}

class __ListViewState extends State<_ListView> {
  final _list = <WordPair>[];

  Widget _BuildCard(WordPair word) {
    final wordText = word.asPascalCase;

    String upText = "";
    for (int i = 0; i < wordText.length; i++) {
      if (isUppercase(wordText[i])) {
        upText += wordText[i];
      }
    }
    String number = "+336";
    Random random = Random();
    String randomDigits = (10000000 + random.nextInt(100000000 - 10000000)).toString();
    number += randomDigits;
    return Card(
      color: Colors.white70,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Text(upText),
        ),
        title: Text(
            wordText, style: TextStyle(color: Colors.white, fontSize: 20)),
        subtitle: Text(number),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          if (index >= _list.length) {
            _list.addAll(generateWordPairs().take(10));
          }
          return _BuildCard(_list[index]);
        }
    );
  }
}

//
// class BuildCard extends StatelessWidget {
//   BuildCard({Key key, this.word}) : super(key: key);
//   final word;
//
//   @override
//   Widget build(BuildContext context) {
//     String wordText = word.asPascalCase;
//     String upText = "";
//     for (int i = 0; i < wordText.length; i++) {
//       if (isUppercase(wordText[i])) {
//         upText += wordText[i];
//       }
//     }
//     String number = "+336";
//     Random random = Random();
//     String randomDigits = (10000000 + random.nextInt(100000000 - 10000000)).toString();
//     number += randomDigits;
//
//     return Card(
//       color: Colors.white70,
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.black,
//           child: Text(upText),
//         ),
//         title: Text(wordText, style: TextStyle(color: Colors.white, fontSize: 20)),
//         subtitle: Text(number),
//       ),
//     );
//   }
// }

