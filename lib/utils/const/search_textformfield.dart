import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../photos/photos.dart';

class SearchTextformfield extends StatelessWidget {
  const SearchTextformfield({super.key, required this.hint});
final String hint;
  @override
  Widget build(BuildContext context) {
    return                 SizedBox(
      width: 0.8 * MediaQuery.sizeOf(context).width,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText:hint,
          hintStyle: TextStyle(
              fontWeight:FontWeight.w500,
              fontSize: 15
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                image: DecorationImage(

                  image: AssetImage(Photos.searchlocation,),
                ),
              ),
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/egypt.png'), 
                ),
              ),
            ),
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
      ),
    );
  }
}
