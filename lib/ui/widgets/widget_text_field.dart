import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  final double paddingHeight;
  final String text;
  final TextEditingController controller;
  final Function validator;
  final bool? obscure;

  const WidgetTextField(
      {Key? key,
      required this.paddingHeight,
      required this.text,
      required this.controller,
      required this.validator,
      this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (obscure != null) {
      return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * paddingHeight),
        child: TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            validator: (value) {
              return validator(value);
            },
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: text,
                hintStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Colors.grey))),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * paddingHeight),
        child: TextFormField(
            validator: (value) {
              return validator(value);
            },
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: text,
                hintStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Colors.grey))),
      );
    }
  }
}
