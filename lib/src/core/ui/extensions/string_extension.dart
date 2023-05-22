extension StringExtension on String {
  String capitalFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
