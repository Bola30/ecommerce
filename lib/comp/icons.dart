import 'package:flutter/material.dart';

class icon extends StatelessWidget {
  TextEditingController icons = TextEditingController();
   List Categories = [
    {"Iconname" :Icons.facebook_outlined },
    {"Iconname" :Icons.tiktok_outlined },
    {"Iconname" :Icons.apple_outlined },
  ];
     icon({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                itemCount: Categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , i) {   
                  return              
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(100)),
                        child: 
                            Icon(Categories[i]["Iconname"] , size: 40),
                      ),
                  ],);
                })

              ],
            );
  }
}