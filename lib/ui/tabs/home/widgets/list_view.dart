import 'package:example_app/utils/images.dart';
import 'package:example_app/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors.dart';

class ShowListView extends StatelessWidget {
  const ShowListView({
    super.key,
    this.showTexts = false,
    required this.texts,
  });

  final bool showTexts;
  final List<String> texts;

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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(texts.first == "" ? AppImages.item1 : AppImages.item2, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    color: AppColors.black.withOpacity(0.1),
                    child: Text(
                      texts[index],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.spMax,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
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
