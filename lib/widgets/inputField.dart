import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  late String text;
  late Icon icon;
  ValueChanged<String> onChanged;

  InputField(this.text, this.icon, this.onChanged);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: icon,
          label: Text(
            text,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          )),
    );
  }
}
