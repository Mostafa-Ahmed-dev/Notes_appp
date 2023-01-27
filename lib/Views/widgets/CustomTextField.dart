import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noteapp/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.maxlines = 1,
      this.onSaved,
      this.onChanged});
  final String text;
  final int maxlines;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: ((value) {
        if (value?.isEmpty ?? true) {
          return 'field is empty';
        } else {
          return null;
        }
      }),
      maxLines: maxlines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: text,
        border: newMethod(),
        enabledBorder: newMethod(),
        focusedBorder: newMethod(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder newMethod([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
