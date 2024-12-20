import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double totalPrice = 0;

  void updateTotalPrice(double price) {
    setState(() {
      totalPrice += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        body: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Calculateur",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
            ItemCalculator(
                label: "Clavier",
                price: 50,
                onTotalPriceUpdate: updateTotalPrice),
            ItemCalculator(
                label: "Ecran",
                price: 200.99,
                onTotalPriceUpdate: updateTotalPrice),
            ItemCalculator(
                label: "Mannette",
                price: 45.99,
                onTotalPriceUpdate: updateTotalPrice),
            ItemCalculator(
                label: "Stylo",
                price: 1.5,
                onTotalPriceUpdate: updateTotalPrice),
            Text("${totalPrice.toStringAsFixed(2)} €")
          ],
        ),
      ),
    );
  }
}

class ItemCalculator extends StatefulWidget {
  String label;
  double price = 0;
  Function(double) onTotalPriceUpdate;

  ItemCalculator({
    super.key,
    required this.label,
    required this.price,
    required this.onTotalPriceUpdate,
  });

  @override
  State<ItemCalculator> createState() => _ItemCalculatorState();
}

class _ItemCalculatorState extends State<ItemCalculator> {
  double quantity = 0;

  void plusOneQuantity() {
    if (quantity < 100) {
      setState(() {
        quantity++;
        widget.onTotalPriceUpdate(widget.price);
      });
    }
  }

  void minusOneQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        widget.onTotalPriceUpdate(-widget.price);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.label),
          SizedBox(width: 25),
          Text("${widget.price} €"),
          SizedBox(width: 25),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.purple)),
              onPressed: () => minusOneQuantity(),
              child: Row(
                children: [Icon(Icons.remove, color: Colors.white)],
              )),
          SizedBox(width: 25),
          Text(quantity.toString()),
          SizedBox(width: 25),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.purple)),
              onPressed: () => plusOneQuantity(),
              child: Row(
                children: [Icon(Icons.add, color: Colors.white)],
              )),
          SizedBox(width: 25),
        ],
      ),
    );
  }
}
