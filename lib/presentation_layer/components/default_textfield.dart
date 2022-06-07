import 'package:flutter/material.dart';
import 'package:shop_app/constatnts/theme_manager.dart';

Widget defaultTextField({
  VoidCallback? onTap,
  TextEditingController? controller,
  TextStyle? style,
  required bool isHidden,
  Function(String value)? onChanged,
  Function(String value)? onFieldSubmitted,
  TextInputType? type,
  String? hintText,
  IconData? suffix,
  IconData? prefix,
  Function()? suffixPressed,
  Key? key,
  Color? cursorColor,
  required String? Function(String? value)? validator,
}) {
  return TextFormField(
    obscureText: isHidden,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
    key: key,
    controller: controller,
    onChanged: (String value) {},
    cursorColor: ThemeManager.lightTheme.primaryColor,
    decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Material(
          elevation: 0,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Icon(prefix, color: ThemeManager.lightTheme.primaryColor),
        ),
        suffixIcon: Material(
          elevation: 0,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: InkWell(
            onTap: suffixPressed,
            child: Icon(
              suffix,
              color: ThemeManager.lightTheme.primaryColor,
            ),
          ),
        ),
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
  );
}
