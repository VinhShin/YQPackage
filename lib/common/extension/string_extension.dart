extension StringExtension on String {
  bool toBool() {
    if (this == null) {
      return false;
    }
    return toLowerCase() == 'true';
  }

  bool isBlank() {
    if (this == null || isEmpty) {
      return true;
    }
    return false;
  }

  bool isNotBlank() {
    return !isBlank();
  }

  double toDouble({double defaultValue = 0.0}){
    return double.tryParse(this) ?? defaultValue;
  }
}
