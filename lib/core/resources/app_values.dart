import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMargin {
  static const double m8 = 8.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
}

class AppPadding {
  static const double defaultPadding = 16.0;

  static const double zero = 0.0;
  static const double p2 = 2.0;
  static const double p5 = 5.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p28 = 28.0;
  static const double p30 = 30.0;
  static const double p32 = 32.0;
  static const double p38 = 38.0;
  static const double p40 = 40.0;
  static const double p48 = 48.0;
  static const double p50 = 50.0;
  static const double p52 = 52.0;
  static const double p100 = 100.0;
}

class AppBorderRadius {
  static double defaultBorderRadius = 12.0.r;
  static double br4 = 4.0.r;
  static double br8 = 8.0.r;
  static double br13 = 13.0.r;
  static double br16 = 16.0.r;
  static double br20 = 20.0.r;
  static double br24 = 24.0.r;
  static double br32 = 32.0.r;
  static double br40 = 40.0.r;
  static double br48 = 48.0.r;
  static double br56 = 56.0.r;
  static double br64 = 64.0.r;
  static double br72 = 72.0.r;
}

class AppSize {
  static const double s0 = 0;
  static const double s1 = 1;
  static const double s2 = 2;
  static const double s1_5 = 1.5;
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s30 = 30.0;
  static const double s32 = 32.0;
  static const double s34 = 34.0;
  static const double s36 = 36.0;
  static const double s40 = 40.0;
  static const double s50 = 50.0;
  static const double s52 = 52.0;
  static const double s60 = 60.0;
  static const double s66 = 66.0;
  static const double s70 = 70.0;
  static const double s80 = 80.0;
  static const double s90 = 90.0;
  static const double s96 = 96.0;
  static const double s100 = 100.0;
  static const double s116 = 116.0;
  static const double s120 = 120.0;
  static const double s140 = 140.0;
  static const double s150 = 150.0;
  static const double s160 = 160.0;
  static const double s190 = 190.0;
  static const double s200 = 200.0;
  static const double s210 = 210.0;
  static const double s218 = 218.0;
  static const double s224 = 224.0;
  static const double s226 = 226.0;
  static const double s230 = 230.0;
  static const double s240 = 240.0;
  static const double s260 = 260.0;
  static const double s300 = 300.0;
  static const double s310 = 310.0;
  static const double s335 = 335.0;
  static const double s350 = 350.0;
  static const double s360 = 360.0;


}



/*
    ScreenUtil().setWidth(540)  (dart sdk>=2.6 : 540.w) //Adapted to screen width
    ScreenUtil().setHeight(200) (dart sdk>=2.6 : 200.h) //Adapted to screen height , under normal circumstances, the height still uses x.w
    ScreenUtil().radius(200)    (dart sdk>=2.6 : 200.r)    //Adapt according to the smaller of width or height
    ScreenUtil().setSp(24)      (dart sdk>=2.6 : 24.sp) //Adapter font
    12.sm   //return min(12,12.sp)

    ScreenUtil().pixelRatio       //Device pixel density
    ScreenUtil().screenWidth   (dart sdk>=2.6 : 1.sw)    //Device width
    ScreenUtil().screenHeight  (dart sdk>=2.6 : 1.sh)    //Device height
    ScreenUtil().bottomBarHeight  //Bottom safe zone distance, suitable for buttons with full screen
    ScreenUtil().statusBarHeight  //Status bar height , Notch will be higher
    ScreenUtil().textScaleFactor  //System font scaling factor

    ScreenUtil().scaleWidth //The ratio of actual width to UI design
    ScreenUtil().scaleHeight //The ratio of actual height to UI design

    ScreenUtil().orientation  //Screen orientation
    0.2.sw  //0.2 times the screen width
    0.5.sh  //50% of screen height
    20.setVerticalSpacing  // SizedBox(height: 20 * scaleHeight)
    20.horizontalSpace  // SizedBox(height: 20 * scaleWidth)
    const RPadding.all(8)   // Padding.all(8.r) - take advantage of const key word
    EdgeInsets.all(10).w    //EdgeInsets.all(10.w)
    REdgeInsets.all(8)       // EdgeInsets.all(8.r)
    EdgeInsets.only(left:8,right:8).r // EdgeInsets.only(left:8.r,right:8.r).
    BoxConstraints(maxWidth: 100, minHeight: 100).w    //BoxConstraints(maxWidth: 100.w, minHeight: 100.w)
    Radius.circular(16).w          //Radius.circular(16.w)
    BorderRadius.all(Radius.circular(16)).w
*/