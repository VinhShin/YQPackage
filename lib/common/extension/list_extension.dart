extension ListExtension on List {
  bool isBlank() {
    if (this == null || isEmpty) {
      return true;
    }
    return false;
  }

  bool isNotBlank() {
    return !isBlank();
  }

}
