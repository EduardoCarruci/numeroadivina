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
      default:
        return 10;
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
      default:
        return 5;
    }
  }

  int get digits {
    switch (this) {
      case Difficulty.facil:
        return 1;
      case Difficulty.medio || Difficulty.avanzado:
        return 2;

      case Difficulty.extremo:
        return 4;

      default:
        return 1;
    }
  }
}
