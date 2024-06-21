class Game {
  // Variables to store game state
  bool isInitialized = false;
  bool isGameOver = false;
  int lastPressedButtonIndex = 99;
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  var animalNames = ['cat', 'dog', 'elephant', 'lion', 'tiger', 'giraffe', 'monkey', 'zebra', 'penguin', 'koala'];

  // Function to initialize the game
  Game() {
    // TODO: Add initialization logic here
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

    // TODO: Add button press logic here
    if (pressedButtonIndex < 10) {
      lastPressedButtonIndex = pressedButtonIndex;
      return 'Button ${animalNames[pressedButtonIndex]} pressed!';
    }
    else if (lastPressedButtonIndex < 10) {
      String buttonText = '';
      switch (pressedButtonIndex) {
        case 10:
          buttonText = 'Animal ${animalNames[lastPressedButtonIndex]} goes to the zoo!';
          break;
        case 11:
          buttonText = 'Animal ${animalNames[lastPressedButtonIndex]} enjoys some playtime!';
          break;
          case 12:
            buttonText = 'Animal ${animalNames[lastPressedButtonIndex]} takes a nap!';
            break;
          case 13:
            buttonText = 'Animal ${animalNames[lastPressedButtonIndex]} eats some food!';
            break;
          case 14:
            buttonText = 'Animal ${animalNames[lastPressedButtonIndex]} plays with a toy!';
            break;
          case 15:
            buttonText = 'Animal ${animalNames[lastPressedButtonIndex]} goes for a walk!';
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