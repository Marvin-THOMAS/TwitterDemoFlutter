enum ClothType { Trouser, Tshirt, Sock }

class Clothes {
  String color = "";
  ClothType type = ClothType.Tshirt;
  int size = 0;

  Clothes({required this.color, required this.type, this.size = 0});

  Clothes.fromJson(Map<String, dynamic> json) {
    this.color = json['color'];
    this.type = json['type'];
  }

  @override
  String toString() {
    return "${this.type.name} est de couleur ${this.color} ${this.size > 0 ? " et de taille ${this.size}" : ""}";
  }

  String get clothColor {
    return this.color;
  }

  void main() {
    Clothes clothes = Clothes(color: "Bleu", type: ClothType.Tshirt);
    print(clothes.toString());

    Clothes clothes2 =
        Clothes.fromJson({"color": "rouge", "type": ClothType.Trouser});

    print(clothes2.toString());
  }
}
