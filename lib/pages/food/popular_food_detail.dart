import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/Expandable_text_widget.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icons_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.PopularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/pizza.jpg")))
              ) ,

          ),
          //icon Widget
          Positioned(
            top: Dimension.height45,
            left: Dimension.width10,
            right: Dimension.width10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],
            )),
          //introduction of food
          Positioned( 
            left: 0,
            right: 0,
            top: Dimension.PopularFoodImgSize-20,
            child: Container(
                padding: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20, top: Dimension.height20 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimension.radius20),
                    topLeft: Radius.circular(Dimension.radius20)
                  ),
                  color: Colors.white
                ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                AppColumn(text: "Chinise side"),
                SizedBox(height: Dimension.height20),
                BigText(text: "Introduce"),
                Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")))
              ],
            ),
      )
            ),
          

       ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.bottomHeightbar,
        padding: EdgeInsets.only(top: Dimension.height30, bottom: Dimension.height30, left: Dimension.width20, right: Dimension.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.radius20*2),
            topRight: Radius.circular(Dimension.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimension.height20, bottom: Dimension.height10, left: Dimension.width20, right: Dimension.width20 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimension.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimension.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimension.height20, bottom: Dimension.height10, left: Dimension.width20, right: Dimension.width20 ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: AppColors.mainColor
              ),

            )
          ],
        ),
      ),

    );
  }
}