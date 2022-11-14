import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextFiledSimple(TextEditingController controller,
    {bool obscure = false,
    int? maxChar,
    double height = 45,
    double textSize = 15,
    Color? textColor,
    Color? cursorColor,
    Function? onChange,
    Color? borderColor,
    TextStyle? hintStyle,
    List<TextInputFormatter> textInputFormatter = const [],
    Widget? icon,
    Widget? prefix,
    bool readOnly = false,
    TextInputType textInputType = TextInputType.text,
    String hint = ''}) {
  return SizedBox(
    height: height,
    child: TextField(
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      obscureText: obscure,
      maxLength: maxChar,
      controller: controller,
      cursorColor: Colors.white,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hint,
          prefixIcon: prefix,
          hintStyle: TextStyle(color: Colors.grey.shade600),
          focusedBorder: _outlineBorder(),
          enabledBorder: _outlineBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: _outlineBorder()),
    ),
  );
}

OutlineInputBorder _outlineBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffD9D9D9)),
      borderRadius: BorderRadius.circular(5));
}
