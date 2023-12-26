import 'package:example_app/utils/colors.dart';
import 'package:example_app/utils/size.dart';
import 'package:example_app/utils/svges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    this.isLine = false,
    required this.name,
    required this.oldPrise,
    required this.prise,
    required this.image,
  });

  final bool isLine;
  final String image;
  final String name;
  final String oldPrise;
  final String prise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLine
          ? Container(
              padding: EdgeInsets.all(15.sp),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 170.w,
                      height: 130.w,
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  ),
                  34.ph,
                  SizedBox(
                    width: 270.w,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 14.spMax,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            oldPrise,
                            style: TextStyle(
                              fontSize: 14.spMax,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              decoration: TextDecoration.lineThrough,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            prise,
                            style: TextStyle(
                              fontSize: 16.spMax,
                              color: AppColors.orange,
                              fontWeight: FontWeight.w700,
                              fontFamily: "OpenSans",
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      ZoomTapAnimation(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 3.h),
                          decoration: BoxDecoration(color: AppColors.orange, borderRadius: BorderRadius.circular(8.r)),
                          child: SvgPicture.asset(AppIcons.basket),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Container(
              height: 132.h,
              width: 375.w,
              padding: EdgeInsets.all(15.sp),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 91.w,
                      height: 81.w,
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 210.w,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 14.spMax,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "OpenSans",
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 210.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  oldPrise,
                                  style: TextStyle(
                                    fontSize: 14.spMax,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "OpenSans",
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  prise,
                                  style: TextStyle(
                                    fontSize: 16.spMax,
                                    color: AppColors.orange,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "OpenSans",
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const Spacer(),
                            ZoomTapAnimation(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
                                decoration: BoxDecoration(color: AppColors.orange, borderRadius: BorderRadius.circular(8.r)),
                                child: SvgPicture.asset(AppIcons.basket),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
