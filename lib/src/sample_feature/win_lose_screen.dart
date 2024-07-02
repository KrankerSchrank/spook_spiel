import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class WinLose extends StatefulWidget {
  const WinLose({super.key, required this.state});
  static const routeName = '/game_end';
  final int state;
  
  @override
  State<WinLose> createState() => _WinLose();
  }

class _WinLose extends State<WinLose>{
  String text = '';
  String title = '';
 @override
  void initState() {
    super.initState();
    _stateText();
  }
  void _stateText() {
    // -2 = bane lose, -1 = time lose, 1 = win
    if (widget.state == -2) {
        text = 'Der bane hält euch alle gefangen, ihr habt verloren :c';
        title = 'Verloren!';
    }
    if (widget.state == -1) {
        text = 'Ihr habt zu lange gebraucht, der Bane hat seine Kräfte wieder und verwandelt euch alle in katzen \n Ihn habt das Spiel verloren.';
         title = 'Verloren!';
    }
    if (widget.state == 1) {
        text = 'Der Besessene wurde enttarnt, ab auf den Scheiterhaufen mit ihm!';
        title = 'Gewonnen!';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(text),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/',
                );
              },
              child: const Text('Zurück zum Start'),
            ),
          ],
        ),
        ),
    );
  }
}