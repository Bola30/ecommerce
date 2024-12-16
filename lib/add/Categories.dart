import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_test/comp/textformfield.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  Future<void> addcategory() {
    // Call the user's CollectionReference to add a new user
    return categories
        .add({"name": name.text})
        .then(
          (value) => print("Category Added"),
        )
        .catchError((error) => AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: 'Warning',
              desc: 'No Result',
            ).show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: const Color.fromARGB(255, 29, 51, 89),
        title: Text(
          "Add Category",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
          key: formstate,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextformfield(
                    hintText: "Enter Name",
                    mycontroller: name,
                    validator: (val) {
                      if (val == "") {
                        return "No Result";
                      }
                    }),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color.fromARGB(255, 29, 51, 89),
                  onPressed: () {
                    addcategory();
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
