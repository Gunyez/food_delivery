import 'package:get/get.dart';

class Dimension {
  //screen height = 783
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  
  //
  static double pageView = screenHeight/2.447;
  static double pageViewContainer = screenHeight/3.559;
  static double pageViewTextContainer = screenHeight/6.525;

  //dynamic height padding and margin
  static double height10 = screenHeight/78.3;
  static double height15 = screenHeight/52.2;
  static double height20 = screenHeight/39.15;
  static double height30 = screenHeight/26.1;
  static double height45 = screenHeight/17.4;



  //dynamic width padding and margin
  static double width10= screenHeight/78.3;
  static double width15 = screenHeight/52.2;
  static double width20 = screenHeight/39.15;
  static double width30 = screenHeight/26.1;

  //font size
  static double font16 = screenHeight/48.94;
  static double font20 = screenHeight/39.15;
  static double font26 = screenHeight/30.11;

  //radius
  static double radius15 = screenHeight/52.2;
  static double radius20 = screenHeight/39.15;
  static double radius30 = screenHeight/26.1;

  //icon size
  static double iconSize24 = screenHeight/32.625;
  static double iconSize16 = screenHeight/21.75;

  //list view size(used tuitorial size)
  static double ListViewImgSize =screenWidth/3.25;
  static double ListViewTextConstSize = screenWidth/3.9;

  //popular food
  static double PopularFoodImgSize = screenHeight/2.23;
  
  //bottom height
  static double bottomHeightbar = screenHeight/6.53;

}