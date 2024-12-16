
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> dataitems;

  const CartPage({Key? key, required this.dataitems}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.dataitems.length,
        itemBuilder: (context, index) {
          int quantity = widget.dataitems[index]['quantity']; // الحصول على الكمية من المنتج

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 160, // ارتفاع الكارد
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // صورة المنتج
                      Container(
                        height: 140,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(widget.dataitems[index]['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // معلومات المنتج
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dataitems[index]['name'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${widget.dataitems[index]['price']}\$",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        widget.dataitems[index]['quantity']--;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove, size: 18),
                                ),
                                Text(
                                  "$quantity",
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.dataitems[index]['quantity']++;
                                    });
                                  },
                                  icon: const Icon(Icons.add, size: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.dataitems.removeAt(index); // حذف المنتج من السلة
                          });
                        },
                        icon: const Icon(Icons.delete, color: Colors.red, size: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
