import 'package:first_test/add/cart.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Map<String, dynamic> dataitems;

  const ItemDetails({super.key, required this.dataitems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.grey[200],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network(
            dataitems['image'],
            height: 400,
          ),
          const SizedBox(height: 20),
          Text(
            dataitems['name'],
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            dataitems['description'],
            style: const TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            "${dataitems['price']}\$",
            style: const TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold , backgroundColor: Color.fromARGB(255, 239, 230, 221)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () {
             
            },
            child: const Text(
              "Add To Cart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
