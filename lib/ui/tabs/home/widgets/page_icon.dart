import 'package:example_app/utils/images.dart';
import 'package:example_app/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors.dart';

class PageIndexItem extends StatelessWidget {
  const PageIndexItem({
    super.key,
    required this.activePageIndex,
  });

  final int activePageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        activePageIndex == 0
            ? Container(
                height: 34.w,
                width: 34.w,
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(border: Border.all(width: 2.w,color: AppColors.orange), borderRadius: BorderRadius.circular(100.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(AppImages.product, fit: BoxFit.cover),
                ),
              )
            : Container(
                height: 34.w,
                width: 34.w,
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(border: Border.all(width: 2.w,color: AppColors.white), borderRadius: BorderRadius.circular(100.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(AppImages.product, fit: BoxFit.cover),
                ),
              ),
        8.pw,
        activePageIndex == 1
            ? Container(
                height: 34.w,
                width: 34.w,
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(border: Border.all(width: 2.w,color: AppColors.orange), borderRadius: BorderRadius.circular(100.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(AppImages.product2, fit: BoxFit.cover),
                ),
              )
            : Container(
                height: 34.w,
                width: 34.w,
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(border: Border.all(width: 2.w,color: AppColors.white), borderRadius: BorderRadius.circular(100.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(AppImages.product2, fit: BoxFit.cover),
                ),
              ),
        8.pw,
        activePageIndex == 2
            ? Container(
                height: 34.w,
                width: 34.w,
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(border: Border.all(width: 2.w,color: AppColors.orange), borderRadius: BorderRadius.circular(100.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(AppImages.product3, fit: BoxFit.cover),
                ),
              )
            : Container(
                height: 34.w,
                width: 34.w,
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(border: Border.all(width: 2.w,color: AppColors.white), borderRadius: BorderRadius.circular(100.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.asset(AppImages.product3, fit: BoxFit.cover),
                ),
              ),
      ],
    );
  }
}
