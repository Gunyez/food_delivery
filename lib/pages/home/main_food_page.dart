import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [

        //showing the header
        Container(
        child: Container(
        margin: EdgeInsets.only(top: Dimension.height45, bottom:Dimension.height15),
        padding: EdgeInsets.only(left:Dimension.width20, right:Dimension.width20 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BigText(text: "Kenya", color: AppColors.mainColor),
                Row(
                  children: [
                    SmallText(text: "Nairobi", color: Colors.black54),
                    Icon(Icons.arrow_drop_down_rounded),
                  ],
                )

              ],
            ),
            Center(
              child: Container(
                width: Dimension.height45,
                height: Dimension.height45,
                child: Icon(Icons.search, color:Colors.white, size:Dimension.iconSize24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius15),
                  color: AppColors.mainColor,
                ),
              ),
            )
          ]
        )
      )
    ),
        
        //showing the body
     Expanded(child: SingleChildScrollView(
      child: FoodPageBody(),
     )),
      ],
    )
      
    );
}}