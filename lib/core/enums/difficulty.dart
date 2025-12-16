enum Difficulty {
  facil,
  medio,
  avanzado,
  extremo,
}

extension DifficultyConfig on Difficulty {
  int get maxNumber {
    switch (this) {
      case Difficulty.facil:
        return 10;
      case Difficulty.medio:
        return 20;
      case Difficulty.avanzado:
        return 100;
      case Difficulty.extremo:
        return 1000;
    }
  }

  int get maxAttempts {
    switch (this) {
      case Difficulty.facil:
        return 5;
      case Difficulty.medio:
        return 8;
      case Difficulty.avanzado:
        return 15;
      case Difficulty.extremo:
        return 25;
    }
  }
}
