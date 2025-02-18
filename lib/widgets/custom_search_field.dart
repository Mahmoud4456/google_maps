import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.green[400],
      controller: textEditingController ,
      decoration: InputDecoration(
        focusedBorder:  buildBorder(),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: buildBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: "Search here ",
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      );
  }
}
