import 'dart:ffi';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icons_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController =PageController(viewportFraction: 0.85);
  var _currPageValue =0.0;
  double _scaleFactor = 0.8;
  double  _height = Dimension.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() { 
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //Slider section
          height: Dimension.pageView,
           child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
            return _buildPageItem(position);
           })
       ),


        //dots
       new DotsIndicator(
        dotsCount: 5,
         position: _currPageValue,
         decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          spacing: const EdgeInsets.all(10.0),
          ),
        ),
        
        //Popular Text
       SizedBox(height: Dimension.height30,),
        
        Container(
          margin: EdgeInsets.only(left: Dimension.height30),
          child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimension.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimension.width10),
              Container(
                 margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Foood pairing"),
              )
            ],
          )
        ),
        
        //list of food and imagee  
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder:(context, index) {
            return Container(
              margin: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20, bottom: Dimension.height10),
              child:
              Row(
                children:[

                //image section
                Container(
                  width: Dimension.ListViewImgSize,
                  height: Dimension.ListViewImgSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                         "assets/images/pizza.jpg"
                        )),
              


                  ),),

                  //text container
                  Expanded(
                    child: Container(
                      height: Dimension.ListViewTextConstSize,
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.radius20),
                          bottomRight: Radius.circular(Dimension.radius20)
                        ), 
                        color: Colors.white
                      ),
                      child: 
                      Padding(
                        padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Nutritious fruit meal in china"),
                            SizedBox(height: Dimension.height10,),
                            SmallText(text: "With chinese characteristics"),
                            SizedBox(height: Dimension.height10,),
                            Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(icon: Icons.circle_sharp, 
                                    text: "normal",
                                    iconColor: AppColors.iconColor1),
                          
                                    IconAndTextWidget(icon: Icons.location_on, 
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor),
                          
                                    IconAndTextWidget(icon: Icons.access_time_rounded, 
                                    text: "32min",
                                    iconColor: AppColors.iconColor2)
                                  ],
                                )
                          ],
                        ),

                        ),
                        
                    ),
                  )

                ],
              ) 
              ,
            );
          },),
        
      ],
    );
  }

   
  Widget _buildPageItem(int index){
   Matrix4 matrix = Matrix4.identity();
   if (index==_currPageValue.floor()) {
     var currScale = 1-(_currPageValue-index) * (1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);


   }else if(index == _currPageValue.floor()+1){
    var currScale = _scaleFactor+(_currPageValue-index*1)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }else if(index == _currPageValue.floor()-1){
    var currScale = 1-(_currPageValue-index*1)*(1-_scaleFactor);
    var currTrans = _height*(1-currScale)/2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }else{
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
   }
  

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(height: Dimension.pageViewContainer,
        margin: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.radius30),
          color: index.isEven?Color(0xFF69c5df): Color(0xFF9294cc),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
            "assets/images/pizza.jpg"
            ))
        ),
      ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimension.pageViewTextContainer,
                margin: EdgeInsets.only(left: Dimension.width30, right: Dimension.width30, bottom: Dimension.height30),
                decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.radius20),
            color: Colors.white,
            boxShadow: [
            BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(0, 5)
            ),
            BoxShadow(
              color: Colors.white,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(5, 0)
            )
            ]
      ),

      child: Container(
      padding: EdgeInsets.only(top: Dimension.height15, left: Dimension.width15, right: Dimension.width15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: "Chinese side"),
          SizedBox(height: Dimension.height10,),

          Row(
            children: [
              Wrap(
                children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor,size:15 ,)),
              ),
              SizedBox(width: Dimension.width10,),
              SmallText(text: "4.5"),
              SizedBox(width: Dimension.width10,),
              SmallText(text: "1287"),
              SizedBox(width: Dimension.width10,),
              SmallText(text: "comments"),
    
            ],
          ),
          SizedBox(height: Dimension.height20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(icon: Icons.circle_sharp, 
              text: "normal",
              iconColor: AppColors.iconColor1),
    
              IconAndTextWidget(icon: Icons.location_on, 
              text: "1.7km",
              iconColor: AppColors.mainColor),
    
              IconAndTextWidget(icon: Icons.access_time_rounded, 
              text: "32min",
              iconColor: AppColors.iconColor2)
            ],
          )
        ],
      ),
      ),
              ),
          )
          
        ],
        
      ),
    );
} }