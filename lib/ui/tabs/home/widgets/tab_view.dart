import 'package:easy_localization/easy_localization.dart';
import 'package:example_app/ui/tabs/home/widgets/global_button.dart';
import 'package:example_app/utils/images.dart';
import 'package:example_app/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors.dart';
import 'item_view.dart';

class ShowTabView extends StatelessWidget {
  const ShowTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
            child: TabBar(
              labelColor: AppColors.orange,
              unselectedLabelColor: AppColors.grey,
              indicatorColor: AppColors.orange,
              indicatorWeight: 1.5.w,
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
              tabs: [
                Tab(text: tr("Новинки")),
                Tab(text: tr("Популярное")),
                Tab(text: tr("Скидки + Рассрочка")),
              ],
            ),
          ),
          10.ph,
          ListView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: 475.h,
                decoration: const BoxDecoration(color: AppColors.white),
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        ...List.generate(
                          3,
                          (index) => SizedBox(
                            width: 375.w,
                            height: 132.h,
                            child: ItemView(
                              name: "Микроволновая печь соло Gorenje MO17E1W",
                              oldPrise: "${index + 2} 000 000 сум",
                              prise: "${index + 1} 7${index}0 000 сум",
                              image: [AppImages.product, AppImages.product2, AppImages.product3][index],
                              isLine: true,
                            ),
                          ),
                        ),
                        26.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SizedBox(width: 375.w, child: GlobalButton(onTap: () {ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.grey.withOpacity(0.9),
                              elevation: 0,
                              duration: const Duration(milliseconds: 700),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              behavior: SnackBarBehavior.floating,
                              padding: EdgeInsets.all(5.sp),
                              dismissDirection: DismissDirection.horizontal,
                              width: 150.w,
                              content: Center(
                                child: Text(
                                  "Смотреть все 15",
                                  style: TextStyle(
                                    fontSize: 14.spMax,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "OpenSans",
                                  ),
                                ),
                              ),
                            ),
                          );}, text: "Смотреть все 15")),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ...List.generate(
                          3,
                          (index) => SizedBox(
                            width: 375.w,
                            height: 132.h,
                            child: ItemView(
                              name: "Микроволновая печь соло Gorenje MO17E1W",
                              oldPrise: "${index + 2} 000 000 сум",
                              prise: "${index + 1} 7${index}0 000 сум",
                              image: [AppImages.product2, AppImages.product3, AppImages.product][index],
                              isLine: true,
                            ),
                          ),
                        ),
                        26.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SizedBox(width: 375.w, child: GlobalButton(onTap: () {ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.grey.withOpacity(0.9),
                              elevation: 0,
                              duration: const Duration(milliseconds: 700),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              behavior: SnackBarBehavior.floating,
                              padding: EdgeInsets.all(5.sp),
                              dismissDirection: DismissDirection.horizontal,
                              width: 150.w,
                              content: Center(
                                child: Text(
                                  "Смотреть все 25",
                                  style: TextStyle(
                                    fontSize: 14.spMax,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "OpenSans",
                                  ),
                                ),
                              ),
                            ),
                          );}, text: "Смотреть все 25")),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ...List.generate(
                          3,
                          (index) => SizedBox(
                            width: 375.w,
                            height: 132.h,
                            child: ItemView(
                              name: "Микроволновая печь соло Gorenje MO17E1W",
                              oldPrise: "${index + 2} 000 000 сум",
                              prise: "${index + 1} 7${index}0 000 сум",
                              image: [AppImages.product3, AppImages.product, AppImages.product2][index],
                              isLine: true,
                            ),
                          ),
                        ),
                        26.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SizedBox(
                              width: 375.w,
                              child: GlobalButton(
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
                                        width: 150.w,
                                        content: Center(
                                          child: Text(
                                            "Смотреть все 20",
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
                                  text: "Смотреть все 20")),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
