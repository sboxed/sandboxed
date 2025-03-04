abstract base class Addon {
  String get id;

  Map<String, dynamic>? serialize() {
    return null;
  }

  void deserialize(Map<String, dynamic> json) {}
}
