import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormAreatwo extends StatelessWidget {

  final String hint;
  final funValidator;
  final controller;

  const CustomTextFormAreatwo({required this.hint,required this.funValidator, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextFormField(
        controller: controller,
        maxLines: 10,
        validator:  funValidator,
        decoration: InputDecoration(
          labelText: '$hint',
          hintText: "Enter $hint",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),

        ),
      ),
    );
  }
}