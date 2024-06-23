import 'dart:math' show Random;

class Game {
  // Variables to store game state
  bool isInitialized = false;
  bool isGameOver = false;
  int lastPressedButtonIndex = 99;
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  var besessene = ['Wirtin', 'Hebamme', 'Kräuterkundige', 'Bäurin', 'Fischer', 'Schmied', 'Priester', 'Totengräber', 'Stadtwächter', 'Bürgermeisterin'];
  var monster = ['Laminahexe', 'Erdgeist', 'Flusshexe', 'Skelt', 'Feuergeist', 'Nekromant', 'Bogart', 'Wicht', 'Mänade'];
  var bannItems = ['Salz', 'Eisen', 'Silberkette', 'Stab', 'Messer', 'Schere', 'Gold', 'Lampe', 'Amulett', 'Kreuz'];
  var bannPosition = ['', '', '', '', '', '', '', '', '', ''];
  var bannStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  var items = ['Universalschlüssel', 'Salz', 'Eisen', 'Silberkette', 'Stab', 'Messer', 'Schere', 'Gold', 'Lampe', 'Amulett', 'Kreuz'];
  var inventory = [];
  var schluessel = 0;
  var position = ['', '', '', '', '', '', '', '', '', ''];
  var used = [];
  var item = '';

  // Function to initialize the game
  Game() {
    isInitialized = true;
  }

  // Function to process button presses
  String processButtonPress(int pressedButtonIndex) {
    if (!isInitialized) {
      throw Exception('Game not initialized!');
    }

    if (isGameOver) {
      throw Exception('Game over!');
    }

    if (pressedButtonIndex < 10) {
      lastPressedButtonIndex = pressedButtonIndex;
      return 'Button ${besessene[pressedButtonIndex]} pressed!';
    }
    else if (lastPressedButtonIndex < 10) {
      String buttonText = '';
      switch (pressedButtonIndex) {
        case 10:
          if (position[lastPressedButtonIndex] == '') {
            int random = Random().nextInt(items.length);
            if (items[random] == 'Universalschlüssel') {
              schluessel += 1;
              item = 'Universalschlüssel';
            }
            else {
              position[lastPressedButtonIndex] = items[random];
              item = position[lastPressedButtonIndex];
              if (random != 0) {
                items.removeAt(random);
              }
            }
          }
          else if (Random().nextInt(5) == 1) {
            item = 'Universalschlüssel';
            schluessel += 1;
          }
          else {
            item = position[lastPressedButtonIndex];
          }
          if (inventory.contains(item) || used.contains(item)) {
            buttonText = 'Hier gibt es nichts zu finden!';
          }
          else {
            buttonText = 'Du hast $item gefunden!';
            inventory.add(item);
          }
          break;
        case 11:
          if (lastPressedButtonIndex == 0) {
            buttonText = 'Hier gibt es keine Monster!';
            break;
          }
          if (bannPosition[lastPressedButtonIndex+1] == '') {
            int random = Random().nextInt(bannItems.length);
            bannPosition[lastPressedButtonIndex+1] = bannItems[random];
            item = bannPosition[lastPressedButtonIndex+1];
            bannItems.removeAt(random);
          }
          else {
            item = bannPosition[lastPressedButtonIndex+1];
          }
          buttonText = 'Du spürst das du ${monster[lastPressedButtonIndex+1]} mit $item bannen kannst!';
          break;
          case 12:
            if (lastPressedButtonIndex == 0) {
              buttonText = 'Hier gibt es keine Monster!';
              break;
            }
            if (bannStatus[lastPressedButtonIndex+1] == 1) {
              buttonText = 'Du hast ${monster[lastPressedButtonIndex+1]} bereits gebannt!';
            }
            else {
              if (bannPosition[lastPressedButtonIndex+1] == '') {
                buttonText = 'Du weißt nicht mit was du ${monster[lastPressedButtonIndex+1]} bannen sollst!';
              }
              else if (inventory.contains(bannPosition[lastPressedButtonIndex+1])) {
                buttonText = 'Du hast ${monster[lastPressedButtonIndex+1]} mit ${bannPosition[lastPressedButtonIndex+1]} gebannt, Der Verräter ist ...!';
                used.add(bannPosition[lastPressedButtonIndex+1]);
                inventory.remove(bannPosition[lastPressedButtonIndex+1]);
                bannStatus[lastPressedButtonIndex+1] = 1;
              }
              else {
                buttonText = 'Du hast ${monster[lastPressedButtonIndex+1]} nicht gebannt, vielleiht fehlt dir die passende Waffe!';
              }
            }
            break;
          case 13:
          // TODO: Implement Zaubern button
            buttonText = 'Animal ${besessene[lastPressedButtonIndex]} eats some food!';
            break;
          case 14:
          // TODO: Implement Aufbrechen button
            buttonText = 'Animal ${besessene[lastPressedButtonIndex]} plays with a toy!';
            break;
        default:
          return 'Error processing button press!';
      }
      lastPressedButtonIndex = pressedButtonIndex;
      return buttonText;
    }
    else {
      return 'Select a Animal first!';
    }
  }
}