 import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  List Categories = [
    {"Iconname": Icons.laptop, "titel": "Laptop"},
    {"Iconname": Icons.phone_android_outlined, "titel": "Phone"},
    {"Iconname": Icons.electric_bike, "titel": "Bike"},
    {"Iconname": Icons.card_giftcard_rounded, "titel": "Gifts"},
    {"Iconname": Icons.add_shopping_cart_rounded, "titel": "Accessories"},
  ];

  Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 30,
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.grey)),
                )),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      iconSize: 40,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  itemCount: Categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(Categories[i]["Iconname"], size: 40),
                        ),
                        Text(
                          Categories[i]["titel"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Bset Selling",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(
              height: 15,
            ),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 300),
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "https://m.media-amazon.com/images/I/41lArSiD5hL._AC_UF894,1000_QL80_.jpg",
                          height: 170,
                          width: 100,
                        ),
                      ),
                      const Text("Sony A500",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "Amazzing HeadPhone And WaterProof . ",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text("100\$",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCiyNeDR-Mlve4GTnPQwDlSb-vPXnecOJvQQ&s" ,                         height: 170,
                          width: 100,
                        ),
                      ),
                      const Text("Apple Watch S7",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "The elegant Watch Form Apple . ",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text("750\$",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSU6kcWXyvthModFNSsB1BH9T4NyDXLaQhMvK_RVtSxHHNzdKTqslhokg6zkoyZ-2z-xyL6kyMny1k3lIH3aPqKv-w2LiqUYSGcXIE6oiPkvRaq9awqpZ0DWRTxSuty-S1Sx2GKR2w&usqp=CAc",
                          height: 170,
                          width: 100,
                        ),
                      ),
                      const Text("Iphone 16 pro Max",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "256G With New Color. ",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text("1000\$",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCiyNeDR-Mlve4GTnPQwDlSb-vPXnecOJvQQ&s" ,
                          height: 170,
                          width: 100,
                        ),
                      ),
                      const Text("Apple Watch S8",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "The elegant Watch Form Apple . ",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text("820\$",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
 