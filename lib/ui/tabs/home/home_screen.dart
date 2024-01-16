import 'package:example_app/ui/tabs/home/widgets/content_view.dart';
import 'package:example_app/ui/tabs/home/widgets/global_button.dart';
import 'package:example_app/ui/tabs/home/widgets/global_sliver.dart';
import 'package:example_app/ui/tabs/home/widgets/list_view.dart';
import 'package:example_app/ui/tabs/home/widgets/page_view.dart';
import 'package:example_app/ui/tabs/home/widgets/tab_view.dart';
import 'package:example_app/utils/colors.dart';
import 'package:example_app/utils/images.dart';
import 'package:example_app/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/cubit/timer_cubit.dart';
import '../../../utils/svges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<TimerCubit>().startTimer();
    super.initState();
  }

  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.background,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.grey.withOpacity(0.9),
                elevation: 0,
                duration: const Duration(milliseconds: 700),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                behavior: SnackBarBehavior.floating,
                padding: EdgeInsets.all(5.sp),
                dismissDirection: DismissDirection.horizontal,
                width: 90.w,
                content: Center(
                  child: Text(
                    "Location",
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
          child: SizedBox(height: 30.w, width: 30.w, child: SvgPicture.asset(AppIcons.location)),
        ),
        centerTitle: true,
        title: Text(
          "ORZUGRAND",
          style: TextStyle(
            letterSpacing: 1,
            color: AppColors.orange,
            fontSize: 18.spMax,
            fontWeight: FontWeight.w900,
            fontFamily: "OpenSans",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.grey.withOpacity(0.9),
                  elevation: 0,
                  duration: const Duration(milliseconds: 700),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  behavior: SnackBarBehavior.floating,
                  padding: EdgeInsets.all(5.sp),
                  dismissDirection: DismissDirection.horizontal,
                  width: 90.w,
                  content: Center(
                    child: Text(
                      "Messages",
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
            child: SizedBox(height: 28.w, width: 28.w, child: SvgPicture.asset(AppIcons.messages)),
          ),
        ],
      ),
      body: GlobalSliver(
        content: const ContentView(),
        body: Container(
          padding: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
            color: AppColors.white,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              15.ph,
              Container(
                height: 55.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.background,
                ),
                child: TextField(
                  style: TextStyle(fontSize: 16.sp, height: 1.5.h, color: Colors.black),
                  cursorColor: AppColors.orange,
                  textAlignVertical: TextAlignVertical.bottom,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: SvgPicture.asset(AppIcons.search),
                    ),
                    hintText: "Поиск товаров",
                    hintStyle: TextStyle(
                      fontSize: 14.spMax,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ),
              ),
              18.ph,
              const ShowListView(
                texts: ["", "", ""],
                images: [AppImages.item1, AppImages.item3, AppImages.item1],
              ),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                        width: 100.w,
                        content: Center(
                          child: Text(
                            "Все акции",
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
                  text: "Все акции",
                ),
              ),
              50.ph,
              const ShowPageView(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Рекомендуем вам",
                  style: TextStyle(
                    fontSize: 22.spMax,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
              14.ph,
              const ShowTabView(),
              40.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "ORZU",
                        style: TextStyle(
                            color: AppColors.green,
                            fontSize: 22.spMax,
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans")),
                    TextSpan(
                        text: "BLOG",
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 22.spMax,
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans")),
                  ]),
                ),
              ),
              20.ph,
              const ShowListView(
                texts: [
                  "Топ-21 лучших недорогих планшетов на сегодняшний день",
                  "Топ-22 лучших недорогих планшетов на сегодняшний день",
                  "Топ-23 лучших недорогих планшетов на сегодняшний день",
                  "Топ-24 лучших недорогих планшетов на сегодняшний день",
                ],
                images: [AppImages.item2, AppImages.item2, AppImages.item2, AppImages.item2],
              ),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                          width: 110.w,
                          content: Center(
                            child: Text(
                              "Читать все",
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
                    text: "Читать все"),
              ),
              84.ph,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 31.w, vertical: 16.h),
                height: 135.h,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "У нас всё!",
                          style: TextStyle(
                            fontSize: 14.spMax,
                            color: AppColors.green,
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans",
                          ),
                        ),
                        Text(
                          "Хватит листать,\nпереходи в каталог.",
                          style: TextStyle(
                            fontSize: 14.spMax,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans",
                          ),
                        ),
                        6.ph,
                        GlobalButton(
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
                                  width: 90.w,
                                  content: Center(
                                    child: Text(
                                      "Каталог",
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
                            text: "Каталог")
                      ],
                    ),
                    const Spacer(),
                    Image.asset(AppImages.phone),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
