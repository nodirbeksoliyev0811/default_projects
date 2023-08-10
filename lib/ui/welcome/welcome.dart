import 'package:default_project/utils/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors.dart';
import '../app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(39.sp),
        child: Column(
          children: [
            SizedBox(height: 139.h),
            Center(
              child: Image.asset(AppImages.logo),
            ),
            SizedBox(height: 13.h),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.c9543FF, AppColors.white],
              ).createShader(bounds),
              child: Text(
                tr("My_Quran"),
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c9543FF),
              ),
            ),
            Text(
              tr("Baca_Al_Quran_Degan_Mudah"),
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cA8A8A8),
            ),
            const Spacer(),
            ZoomTapAnimation(
              onTap: () {
                Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
              },
              child: Container(
                height: 53.h,
                width: 181.w,
                decoration: BoxDecoration(
                  color: AppColors.c9543FF,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Text(
                    tr("Baca_Sekarang"),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
