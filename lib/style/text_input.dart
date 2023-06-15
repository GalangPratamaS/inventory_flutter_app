import 'package:flutter/material.dart';

InputDecoration loginTextInputDecoration(String hintText) {
 return InputDecoration(
     hintText: hintText,
     hintStyle: const TextStyle(color: Colors.grey),
     contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
     border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(32.0),
     ),
     enabledBorder: OutlineInputBorder(
       borderSide: const BorderSide(color: Colors.red, width: 1.0),
       borderRadius: BorderRadius.circular(32.0),
     ),
     focusedBorder: OutlineInputBorder(
         borderSide: const BorderSide(color: Colors.red, width: 2.0),
         borderRadius: BorderRadius.circular(32.0)));
}
