import 'package:flutter/material.dart';
import '../logic/game_logic.dart';

class ButtonGrid extends StatefulWidget {
  const ButtonGrid({super.key, required this.players, required this.difficulty});
  static const routeName = '/game';

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final int players;
  final int difficulty;

  @override
  State<ButtonGrid> createState() => _ButtonGrid();
}

class _ButtonGrid extends State<ButtonGrid> {
  @override
  Widget build(BuildContext context) {
    Game game = Game(widget.players, widget.difficulty);
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Spook - Das Spiel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_outline),
            onPressed: () {
              // Handle refresh press
              game.processButtonPress(15);
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 5,
        childAspectRatio: 1.7,
        children: List.generate(15, (index) {
           var besessene = ['Wirtin', 'Hebamme', 'Kräuterkundige', 'Bäurin', 'Fischer', 'Schmied', 'Priester', 'Totengräber', 'Stadtwächter', 'Bürgermeisterin'];
          return OutlinedButton(
            onPressed: () {
              // Handle button press
              showLoaderDialog(context, index, game);
            },
            child: Text(
              index < 10 ? besessene[index] : index == 10 ? 'Suchen' : index == 11 ? '7. Sinn' : index == 12 ? 'Bannen' : index == 13 ? 'Zaubern' :  'Aufbrechen',
              style: const TextStyle(fontSize: 16.0),
            ),
          );
        }),
      ),
    );
  }
}

showLoaderDialog(BuildContext context, buttonInfo, game) {
  String buttonText = game.processButtonPress(buttonInfo);
    if (buttonText.contains('-2')){
      Navigator.pushReplacementNamed(
        context,
        '/game_end',
        arguments: [-2],
      );
    }
    else if (buttonText.contains('-1')){
      Navigator.pushReplacementNamed(
        context,
        '/game_end',
        arguments: [-1],
      );
    }
    else if (buttonText.contains('gewonnen')){
      Navigator.pushReplacementNamed(
        context,
        '/game_end',
        arguments: [1],
      );
    }
    if (buttonInfo >= 10) {
      AlertDialog alert = AlertDialog(
        content: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 7), child: Text(buttonText)),
                Container(
                  margin: const EdgeInsets.only(left: 70, right: 7),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle OK button press
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ),
          ],
        ),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
}

showCustomLoaderDialog(BuildContext context, String buttonText) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 7), child: Text(buttonText)),
            Container(
              margin: const EdgeInsets.only(left: 70, right: 7),
              child: ElevatedButton(
                onPressed: () {
                  // Handle OK button press
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}