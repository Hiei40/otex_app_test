import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../../utils/photos/photos.dart';
import '../../data/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel,});
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,

        border: Border.all(
          color: AppColors.textColor.withOpacity(0.10),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(9.0),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7.0),
                    topLeft: Radius.circular(7.0),
                  ),
                  color: AppColors.black.withOpacity(0.05),
                ),
                child: ClipRRect(
                  // borderRadius: const BorderRadius.vertical(
                  //   topRight: Radius.circular(5.0),
                  //   topLeft: Radius.circular(5.0),
                  // ),
                  child: Image.asset(
                    productModel.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      productModel.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: Font.tajwal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Spacer(),
                    Image.asset(Photos.offer),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Text(
                      "${  productModel.price}جم/",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.redldark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                    Container(
                      child:Stack(
                        children: [
                          Text(
                            ",${productModel.oldPrice}",
                            style: TextStyle(
                              fontSize: 12,
                              color:AppColors.black.withOpacity(0.50),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ),

                    Spacer(),
                    Image.asset(Photos.favourite),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        Photos.fire,
                        color: AppColors.textColor.withOpacity(0.5),
                        height: 15,
                        width: 15,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "+3.3k تم بيع",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textColor.withOpacity(0.5),
                        fontFamily: Font.tajwal,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(height:30),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xff0062E2),
                            child: Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 8,
                            ),
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(
                              0xff0062E2,
                            ).withOpacity(0.10),
                            child: Image.asset(Photos.icround),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 32,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.black.withOpacity(0.10),
                            width: 2.0,
                          ),
                        ),
                        child: Image.asset("assets/add_shopping_cart.png"),
                      ),
                      SizedBox(width: 10,),
                      Image.asset("assets/7ac3c5cc-e9ec-4a6b-869f-e926a03638f7.png")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
