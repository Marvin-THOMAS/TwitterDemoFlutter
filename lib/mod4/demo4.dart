class MakeUp<T> {
  T color;

  MakeUp(this.color);

  T getColor() {
    return this.color;
  }

  List<int> liste = [1, 2, 3, 4, 5];

  void main() {
    var makeup = MakeUp<int>(23);
    var makeup2 = MakeUp<String>("113231");

    for (var l in liste) {
      print(l);
    }

    liste.forEach((value) {
      print(value);
    });
  }
}
