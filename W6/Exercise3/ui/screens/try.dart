void main() {
  String valueText = "45";

  // WAY 1
  int? value = int.tryParse(valueText);
  if (value != null) {
    print("Cannot parse $valueText");
  }

  // WAY 2
  try {
    int value2 = int.parse(valueText);
    print(value2);
  } on FormatException catch (_, e) {
     print("Cannot parse $valueText");
  }
}
