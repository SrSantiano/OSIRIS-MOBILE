extension NumberParsing on String {
  int toHexFlutterColor() {
    return int.parse("0xFF${substring(1)}");
  }
}
