import 'package:example_app/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/svges.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.profile),
                10.pw,
                Text(
                  "Здравствуйте,",
                  style: TextStyle(
                    fontSize: 16.spMax,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "OpenSans",
                  ),
                ),
                Text(
                  " Дониёр",
                  style: TextStyle(
                    fontSize: 16.spMax,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontFamily: "OpenSans",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                8.pw,
                ...List.generate(
                  12,
                      (index) => Container(
                    height: 160.h,
                    width: 292.w,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: AppColors.white),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(AppImages.box, width: 105.w),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: ZoomTapAnimation(
                            onTap: (){},
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                              height: 30.w,
                              width: 30.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.green.withOpacity(0.5),
                              ),
                              child: Center(child: Icon(Icons.done_rounded, color: AppColors.green)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Готов к выдаче",
                                style: TextStyle(
                                  fontSize: 16.spMax,
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                              10.ph,
                              Text(
                                "Заказ №10021122",
                                style: TextStyle(
                                  fontSize: 14.spMax,
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                              13.ph,
                              Text(
                                "Самовывоз до 29 марта",
                                style: TextStyle(
                                  fontSize: 14.spMax,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                              const Spacer(),
                              ZoomTapAnimation(
                                onTap: (){},
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.orange,
                                  ),
                                  child: Text(
                                    "Забрать заказ",
                                    style: TextStyle(
                                      fontSize: 14.spMax,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "OpenSans",
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                8.pw,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
