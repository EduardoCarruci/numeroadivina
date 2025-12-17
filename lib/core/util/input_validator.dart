class InputValidator {

    // Valida la entrada del usuario para una suposición de número.
  static String? validateGuess(
    String value,
    int maxNumber,
  ) {
    if (value.isEmpty) return 'Ingresa un número';
    final number = int.tryParse(value);
    if (number == null) return 'Solo números permitidos';
    if (number < 1 || number > maxNumber) {
      return 'El número debe estar entre 1 y $maxNumber';
    }
    return null;
  }
}