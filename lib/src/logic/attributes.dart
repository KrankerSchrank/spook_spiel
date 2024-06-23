import 'dart:math';

class Person {
  
  String name = '';
  String gender = '';
  var attribute = '';
  var besessene = ['Wirtin', 'Hebamme', 'Kräuterkundige', 'Bäurin', 'Fischer', 'Schmied', 'Priester', 'Totengräber', 'Stadtwächter', 'Bürgermeisterin'];
  List<String> attributeOptions = ['Groß', 'Dünn', 'Normale Schuhe', 'Kopfbedeckung', 'Lange Ärmel'];
  var besseseneAttribute = ['Dünn', 'Normale Schuhe', 'Normale Schuhe', 'Groß', 'Kopfbedeckung', 'Lange Ärmel', 'Dünn', 'Lange Ärmel', 'Groß', 'Kopfbedeckung'];
  var besseseneGender = ['Frau', 'Frau', 'Frau', 'Frau', 'Mann', 'Mann', 'Mann', 'Mann', 'Mann', 'Frau'];
  var revealed = [];
  var genderRevealed = false;
  Random random = Random();

  Person() {
    var option = random.nextInt(besessene.length);
    name = besessene[option];
    gender = besseseneGender[option];
    attribute = besseseneAttribute[option];
  }

  String hinweis() {
    String reavel = '';
    var genderReveal = random.nextInt(5);
    if (revealed.length == besseseneAttribute.length) {
      if (genderRevealed == false) {
        genderRevealed = true;
        return gender;
      }
      else {
        return 'Du hast alle Hinweise gefunden!';
      }
    }
    if (genderReveal == 0 && genderRevealed == false) {
      genderRevealed = true;
      return gender;
    }
    while (reavel == '' || revealed.contains(reavel) || reavel == attribute) {
      reavel = attributeOptions[random.nextInt(attributeOptions.length)];
    }
    revealed.add(reavel);
    return reavel;
  }

  bool istPerson(String name) {
    if (this.name == name) {
      return true;
    }
    return false;
  }
}