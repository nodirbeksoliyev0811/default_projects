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
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => Container(
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
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                          child: SvgPicture.asset(AppIcons.tick),
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
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.grey.withOpacity(0.9),
                                  elevation: 0,
                                  duration: const Duration(milliseconds: 700),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                                  behavior: SnackBarBehavior.floating,
                                  padding: EdgeInsets.all(5.sp),
                                  dismissDirection: DismissDirection.horizontal,
                                  width: 130.w,
                                  content: Center(
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
                                ),
                              );
                            },
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
              separatorBuilder: (context, index) => Container(
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
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                          child: SvgPicture.asset(AppIcons.tick),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 230.w,
                            child: Text(
                              "Как вам работа приложения?",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.spMax,
                                color: AppColors.orange,
                                fontWeight: FontWeight.w700,
                                fontFamily: "OpenSans",
                              ),
                            ),
                          ),
                          10.ph,
                          Text(
                            "Нам важно ваше мнение",
                            style: TextStyle(
                              fontSize: 14.spMax,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          13.ph,
                          const Spacer(),
                          ZoomTapAnimation(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.grey.withOpacity(0.9),
                                  elevation: 0,
                                  duration: const Duration(milliseconds: 700),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                                  behavior: SnackBarBehavior.floating,
                                  padding: EdgeInsets.all(5.sp),
                                  dismissDirection: DismissDirection.horizontal,
                                  width: 100.w,
                                  content: Center(
                                    child: Text(
                                      "Оценить",
                                      style: TextStyle(
                                        fontSize: 14.spMax,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "OpenSans",
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.orange,
                              ),
                              child: Text(
                                "Оценить",
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
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
