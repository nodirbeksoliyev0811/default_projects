import 'package:example_app/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors.dart';

class ShowListView extends StatelessWidget {
  const ShowListView({
    super.key,
    this.showTexts = false,
    required this.texts,
    required this.images,
  });

  final bool showTexts;
  final List<String> texts;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144.w,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          8.pw,
          ...List.generate(
            texts.length,
            (index) => Container(
              width: 292.w,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: AppColors.background),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox(
                    width: 292.w,
                    height: 160.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(images[index], fit: BoxFit.fill),
                    ),
                  ),
                  texts.first != ""
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.r)),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    AppColors.black,
                                  ])),
                          child: Text(
                            texts[index],
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Visibility(
                    visible: texts.first != "" && index == 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "Статья",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          8.pw,
        ],
      ),
    );
  }
}
