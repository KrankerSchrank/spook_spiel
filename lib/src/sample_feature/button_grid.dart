import 'package:flutter/material.dart';
import '../logic/game_logic.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});
  static const routeName = '/game';
  @override
  Widget build(BuildContext context) {
    Game game = Game();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Grid'),
      ),
      body: GridView.count(
        crossAxisCount: 5,
        childAspectRatio: 1.7,
        children: List.generate(15, (index) {
          var animalNames = ['cat', 'dog', 'elephant', 'lion', 'tiger', 'giraffe', 'monkey', 'zebra', 'penguin', 'koala'];
          return OutlinedButton(
            onPressed: () {
              // Handle button press
              showLoaderDialog(context, index, game);
            },
            child: Text(
              index < 10 ? animalNames[index] : index == 10 ? 'Zoo' : index == 11 ? 'Playtime' : index == 12 ? 'Nap' : index == 13 ? 'Food' : index == 14 ? 'Toy' : 'Walk',
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