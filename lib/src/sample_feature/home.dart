import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spook Spiel'),
      ),
      body: Table(
        border: TableBorder.all(width: 15.0,style: BorderStyle.none),
        children: [
          TableRow(
            children: [
              const Text(
              '2 Players:',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 2,
                  'difficulty': 0,
                  },
                );
              },
              child: const Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 2,
                  'difficulty': 1,
                  },
                );
              },
              child: const Text('Medium'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 2,
                  'difficulty': 2,
                  },
                );
              },
              child: const Text('Hard'),
            ),
            ],
          ),
          TableRow(
            children: [
              const Text(
              '3 Players:',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 3,
                  'difficulty': 0,
                  },
                );
              },
              child: const Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 3,
                  'difficulty': 1,
                  },
                );
              },
              child: const Text('Medium'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 3,
                  'difficulty': 2,
                  },
                );
              },
              child: const Text('Hard'),
            ),
            ],
          ),
          TableRow(
            children: [
              const Text(
              '4 Players:',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 4,
                  'difficulty': 0,
                  },
                );
              },
              child: const Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 4,
                  'difficulty': 1,
                  },
                );
              },
              child: const Text('Medium'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 4,
                  'difficulty': 2,
                  },
                );
              },
              child: const Text('Hard'),
            ),
            ],
          ),
        ],
      ),
      /*
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Spook Spiel!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushReplacementNamed(
                  context,
                  '/game',
                  arguments: {
                  'players': 2,
                  'difficulty': 1,
                  },
                );
              },
              child: const Text('Start Game for 2 Players'),
            ),
          ],
        ),
      ),
      */
    );
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 7), child: const Text('Spieleranzahl:')),
              Container(
              margin: const EdgeInsets.only(left: 70, right: 7),
              child: Column(
                children: [
                ElevatedButton(
                  onPressed: () {
                  // Handle OK button press
                  Navigator.of(context).pop('2');
                  },
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {
                  // Handle Cancel button press
                  // Add your code her
                  Navigator.of(context).pop('3');
                  },
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                  // Handle Cancel button press
                  // Add your code here
                  Navigator.of(context).pop('4');
                  },
                  child: const Text('4'),
                ),
                ],
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