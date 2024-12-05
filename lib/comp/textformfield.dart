import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final String hintText;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  const CustomTextformfield({super.key, required this.hintText, required this.mycontroller,required this.validator,});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,
      controller:mycontroller ,
              decoration: InputDecoration(
                  hintText:hintText,
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.grey))),
                      
            );
  }
}