import 'package:flutter/material.dart';

class CustomSearchFeild extends StatelessWidget {
  const CustomSearchFeild({
    super.key,
    required this.controller,
    required this.onChanged,
  });
  final void Function(String value) onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        onChanged: onChanged,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0x1D9E9E9E),
          hintText: 'Search',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
