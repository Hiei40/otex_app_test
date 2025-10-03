import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';

class Minmaxtextform extends StatelessWidget {
  const Minmaxtextform({super.key, required this.hint});
final String hint;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      textDirection: TextDirection.rtl, // For Arabic text alignment
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontWeight:FontWeight.w500,
            fontSize: 15
        ),


        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:  BorderSide(color:AppColors.black.withOpacity(0.10), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:  BorderSide(color:AppColors.black.withOpacity(0.10), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:  BorderSide(color:AppColors.black.withOpacity(0.10), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
