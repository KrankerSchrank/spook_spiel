import 'package:flutter/material.dart';
import '../logic/game_logic.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});
  static const routeName = '/game';
  @override
  Widget build(BuildContext context) {
    Game game = Game(2);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Grid'),
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