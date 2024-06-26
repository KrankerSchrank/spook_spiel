import 'dart:math' show Random;
import 'package:flutter/material.dart';

import 'attributes.dart';
import 'package:audioplayers/audioplayers.dart';

class Game {
  // Variables to store game state
  bool isInitialized = false;
  bool isGameOver = false;
  int lastPressedButtonIndex = 99;
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  var besessene = ['Wirtin', 'Hebamme', 'Kräuterkundige', 'Bäurin', 'Fischer', 'Schmied', 'Priester', 'Totengräber', 'Stadtwächter', 'Bürgermeisterin'];
  var monster = ['Laminahexe', 'Erdgeist', 'Flusshexe', 'Skelt', 'Feuergeist', 'Nekromant', 'Bogart', 'Wicht', 'Mänade'];
  var bannItems = ['Salz', 'Eisen', 'Silberkette', 'Stab', 'Messer', 'Schere', 'Gold', 'Lampe', 'Amulett'];
  var bannPosition = ['', '', '', '', '', '', '', '', '', ''];
  var bannStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  var items = ['Universalschlüssel', 'Salz', 'Eisen', 'Silberkette', 'Stab', 'Messer', 'Schere', 'Gold', 'Lampe', 'Amulett'];
  var inventory = [];
  var schluessel = 0;
  var gesSchluessel = 0;
  var position = ['', '', '', '', '', '', '', '', '', ''];
  var used = [];
  var item = '';
  var zeit = 0;
  var siebterSinn = 0;
  var playerTime = [0, 20, 18, 16];
  var silbertor = 0;
  var strickleiter = 0;
  var zeitZurueck = 0;
  int players;
  Person besessen = Person();
  final player = AudioPlayer();

  // Function to initialize the game
  Game(this.players) {
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
    if (zeit == playerTime[players]) {
      isGameOver = true;
      return 'Die Zeit ist abgelaufen, ihr habt verloren!';
    }

    if (pressedButtonIndex < 10) {
      lastPressedButtonIndex = pressedButtonIndex;
      siebterSinn = 0;
      return 'Button ${besessene[pressedButtonIndex]} pressed!';
    }
    else if (pressedButtonIndex == 12) {
        String buttonText = '';
        if (silbertor == 0 && lastPressedButtonIndex == 9) {
          buttonText = 'Verarschen kann ich mich selber.';
          return buttonText;
        }
        if (lastPressedButtonIndex == 0) {
              buttonText = 'Hier gibt es keine Monster!';
              lastPressedButtonIndex = pressedButtonIndex;
              return buttonText;
            }
            if (bannStatus[siebterSinn] == 1) {
              buttonText = 'Du hast ${monster[siebterSinn]} bereits gebannt!';
            }
            else {
              if (bannPosition[siebterSinn] == '') {
                buttonText = 'Du weißt nicht mit was du ${monster[siebterSinn]} bannen sollst!';
              }
              else if (inventory.contains(bannPosition[siebterSinn])) {
                var bannen = besessen.hinweis();
                if (bannen == 'Du hast alle Hinweise gefunden!') {
                  buttonText = 'Du hast ${monster[siebterSinn]} gebannt, aber ihr habt schon alle Hinweise gefunden!';
                  used.add(bannPosition[siebterSinn]);
                  inventory.remove(bannPosition[siebterSinn]);
                  bannStatus[siebterSinn] = 1;
                  lastPressedButtonIndex = pressedButtonIndex;
                  return buttonText;
                }
                buttonText = 'Du hast ${monster[siebterSinn]} mit ${bannPosition[siebterSinn]} gebannt, Der Verräter ist $bannen!';
                used.add(bannPosition[siebterSinn]);
                inventory.remove(bannPosition[siebterSinn]);
                bannStatus[siebterSinn] = 1;
              }
              else {
                buttonText = 'Du hast ${monster[siebterSinn]} nicht gebannt, vielleiht fehlt dir die passende Waffe!';
              }
            }
            lastPressedButtonIndex = pressedButtonIndex;
            return buttonText;
      }
    else if (lastPressedButtonIndex < 10) {
      String buttonText = '';
      switch (pressedButtonIndex) {
        case 10:
          siebterSinn = 0;
          zeit += 1;
          item = '';

          if (silbertor == 0 && lastPressedButtonIndex == 9) {
            buttonText = 'Verarschen kann ich mich selber.';
            break;
          }
          
          if (position[lastPressedButtonIndex] == '') {
            int random = Random().nextInt(items.length);
            if (items[random] == 'Universalschlüssel') {
              schluessel += 1;
              gesSchluessel += 1;
              if (gesSchluessel == 4) {
                items.removeAt(random);
              }
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
          else if (Random().nextInt(5) == 1 && items.contains('Universalschlüssel')) {
            item = 'Universalschlüssel';
            schluessel += 1;
            gesSchluessel += 1;
            if (gesSchluessel == 4) {
              items.remove('Universalschlüssel');
            }
          }
          else {
            item = position[lastPressedButtonIndex];
          }
          if (item != 'Universalschlüssel') {
            if (inventory.contains(item) || used.contains(item)) {
              buttonText = 'Hier gibt es nichts zu finden!';
            }
            else {
              buttonText = 'Du hast $item gefunden!';
              inventory.add(item);
            }
          }
          else if (item != ''){
            buttonText = 'Du hast einen Universalschlüssel gefunden!';
          }
          else {
            buttonText = 'Hier gibt es nichts zu finden!';
          }
          break;
        case 11:
          zeit += 1;
          if (silbertor == 0 && lastPressedButtonIndex == 9) {
            buttonText = 'Verarschen kann ich mich selber.';
            break;
          }
          if (lastPressedButtonIndex == 0) {
            buttonText = 'Hier gibt es keine Monster!';
            break;
          }
          if (bannPosition[lastPressedButtonIndex-1] == '') {
            int random = Random().nextInt(bannItems.length);
            bannPosition[lastPressedButtonIndex-1] = bannItems[random];
            item = bannPosition[lastPressedButtonIndex-1];
            bannItems.removeAt(random);
          }
          else {
            item = bannPosition[lastPressedButtonIndex-1];
          }
          siebterSinn = lastPressedButtonIndex - 1;
          buttonText = 'Du spürst das du ${monster[lastPressedButtonIndex-1]} mit $item bannen kannst!';
          break;
          case 13:
            zeit += 1;
            switch (lastPressedButtonIndex) {
              case 0:
                buttonText = 'Du konntest deine Freunde erfolgreich aus der Zelle befreien!';
                break;
              case 2:
                int random = Random().nextInt(silbertor == 0 ? 2 : 3);
                if (random == 0 && silbertor == 0) {
                  buttonText = 'Du hast das Silbertor geöffnet!';
                  silbertor = 1;
                }
                else if (random == 1 && silbertor == 1 || random == 2 && silbertor == 1) {
                  buttonText = 'Das Silbertor hat sich Geschlossen!';
                  silbertor = 0;
                }
                else {
                  if (gesSchluessel < 4 && random != 0) {
                    buttonText = 'Du erhälst einen Universalschlüssel!';
                    schluessel += 1;
                    gesSchluessel += 1;
                  }
                  else {
                    buttonText = 'Muhahaha ich bin der Bane und ich stehle dir Zeit!';
                    zeit += players;
                  }
                }
                break;
              case 3:
                int random = Random().nextInt(2);
                if (random == 0) {
                  if (strickleiter == 0) {
                    buttonText = 'Es fällt eine Strickleiter zum Altar von der Decke.';
                    strickleiter = 1;
                  }
                  else {
                    buttonText = 'Die Strickleiter fällt hoch!';
                    strickleiter = 0;
                  }
                }
                else {
                  buttonText = 'Nix passiert kannst du etwa nicht Zaubern?!';
                }
                break;
              case 9:
                if (silbertor == 0) {
                  buttonText = 'Verarschen kann ich mich selber.';
                  break;
                }
                int random = Random().nextInt(3);
                if (zeitZurueck == 0) {
                  if (random == 0) {
                    buttonText = 'Du hast die Zeit zurückgedreht!';
                    zeit = zeit - players*2;
                  }
                  else if (random == 1) {
                    buttonText = 'Du hast die Zeit vorgedreht!';
                    zeit = zeit + players;
                  }
                  else {
                    buttonText = 'Du hast die Zeit ziemlich weit vorgedreht!';
                    zeit = zeit + players*2;
                  }
                }
                if (zeitZurueck == 0) {
                  if (random < 2) {
                    buttonText = 'Du hast die Zeit zurückgedreht!';
                    zeit = zeit - players*2;
                    zeitZurueck = 1;
                  }
                  else {
                    buttonText = 'Du hast die Zeit vorgedreht!';
                    zeit = zeit + players;
                  }
                }
                break;
                default:
                  buttonText = 'Hier gibt es nichts zu Zaubern!';
            }
            break;
          case 14:
            zeit += 1;
            if (silbertor == 0 && lastPressedButtonIndex == 9) {
            buttonText = 'Verarschen kann ich mich selber.';
            break;
          }
            if (schluessel == 0) {
              buttonText = 'Du hast keinen Universalschlüssel!';
            }
            else {
              schluessel -= 1;
              bool istBesessen = besessen.istPerson(besessene[lastPressedButtonIndex]);
              if (istBesessen) {
                buttonText = '${besessene[lastPressedButtonIndex]} war der Verräter, ihr gewinnt!';
                isGameOver = true;
              }
              else {
                buttonText = '${besessene[lastPressedButtonIndex]} ist nicht der Verräter, du kannst diese Person ausschließen!';
              }
            }
            break;
        default:
          return 'Error processing button press!';
      }
      lastPressedButtonIndex = pressedButtonIndex;
      return buttonText;
    }
    else {
      return 'Wähle erst einen Raum!';
    }
  }
}