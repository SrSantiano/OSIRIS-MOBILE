extension NumberParsing on String {
  int toHexFlutterColor() {
    return int.parse("0xFF${this.substring(1)}");
  }
}
