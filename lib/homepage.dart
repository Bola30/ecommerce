import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_test/add/Categories.dart';
import 'package:first_test/add/cart.dart';
import 'package:first_test/auth/login.dart';
import 'package:first_test/details.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.laptop, "title": "Laptop"},
    {"icon": Icons.phone_android_outlined, "title": "Phone"},
    {"icon": Icons.electric_bike, "title": "Bike"},
    {"icon": Icons.card_giftcard_rounded, "title": "Gifts"},
    {"icon": Icons.add_shopping_cart_rounded, "title": "Accessories"},
  ];

  final List<Map<String, String>> products = [
    {
      "name": "Sony A500",
      "description": "Amazing HeadPhone And WaterProof.",
      "price": "100",
      "image":
          "https://m.media-amazon.com/images/I/41lArSiD5hL._AC_UF894,1000_QL80_.jpg",
    },
    {
      "name": "Apple Watch S7",
      "description": "The elegant Watch From Apple.",
      "price": "750",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCiyNeDR-Mlve4GTnPQwDlSb-vPXnecOJvQQ&s",
    },
    {
      "name": "Iphone 16 Pro Max",
      "description": "256G With New Color.",
      "price": "1000",
      "image":
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSU6kcWXyvthModFNSsB1BH9T4NyDXLaQhMvK_RVtSxHHNzdKTqslhokg6zkoyZ-2z-xyL6kyMny1k3lIH3aPqKv-w2LiqUYSGcXIE6oiPkvRaq9awqpZ0DWRTxSuty-S1Sx2GKR2w&usqp=CAc",
    },
    {
      "name": "Apple Watch S8",
      "description": "The elegant Watch From Apple.",
      "price": "820",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCiyNeDR-Mlve4GTnPQwDlSb-vPXnecOJvQQ&s",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Shop"), centerTitle: true),
      endDrawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSearchBar(context),
            const SizedBox(height: 20),
            const Text("Categories", style: _headerStyleBlue),
            const SizedBox(height: 10),
            _buildCategories(),
            const SizedBox(height: 20),
            const Text("Best Selling", style: _headerStyleBlue),
            const SizedBox(height: 10),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homepage()));
              }),
          ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Categories"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CategoriesPage()));
              }),
          ListTile(
              leading: const Icon(Icons.help),
              title: const Text("About"),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.login),
              title: const Text("Login"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              }),
          ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Contact Us"),
              onTap: () {}),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Sign Out"),
            onTap: () => _signOut(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              filled: true,
              hintText: "Search",
              prefixIcon:
                  const Icon(Icons.search, color: Colors.blue, size: 28),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.exit_to_app, size: 30, color: Colors.red),
          onPressed: () => _signOut(context),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(categories[index]['icon'],
                    size: 45, color: Colors.blueGrey),
              ),
              Text(categories[index]['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 280,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
        
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetails(
                dataitems: product,
              ),
            ));
          },
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // التأكد من وجود الصورة
                Image.network(
                  product['image']!,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                // التأكد من وجود الاسم
                Text(
                  product['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product['description']!,
                    textAlign: TextAlign.center,
                  ),
                ),
                // التأكد من وجود السعر
                Text(
                  "${product['price']} \$",
                  style: const TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
  }
}

const _headerStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
const _headerStyleBlue =
    TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue);
