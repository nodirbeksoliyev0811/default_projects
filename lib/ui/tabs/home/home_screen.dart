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
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
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
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: ZoomTapAnimation(
            onTap: () {},
            child: SizedBox(height: 30.w,width: 30.w,child: SvgPicture.asset(AppIcons.location)),
          ),
        ),
        centerTitle: true,
        title: Text(
          "ORZUGRAND",
          style: TextStyle(
            letterSpacing: 1,
            color: AppColors.orange,
            fontSize: 18.spMax,
            fontWeight: FontWeight.w800,
            fontFamily: "OpenSans",
          ),
        ),
        actions: [
          ZoomTapAnimation(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: SizedBox(height: 28.w,width: 28.w,child: SvgPicture.asset(AppIcons.messages)),
            ),
          ),
        ],
      ),
      body: GlobalSliver(
        content: const ContentView(),
        body: Container(
          padding: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
            color: AppColors.white,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.background,
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.search),
                      14.pw,
                      Text(
                        "Поиск товаров",
                        style: TextStyle(
                          fontSize: 14.spMax,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              18.ph,
              const ShowListView(texts: ["", "", ""]),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GlobalButton(onTap: () {}, text: "Все акции"),
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
              const ShowListView(texts: [
                "Топ-21 лучших недорогих планшетов на сегодняшний день",
                "Топ-22 лучших недорогих планшетов на сегодняшний день",
                "Топ-23 лучших недорогих планшетов на сегодняшний день",
                "Топ-24 лучших недорогих планшетов на сегодняшний день",
              ]),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GlobalButton(onTap: () {}, text: "Читать все"),
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
                        GlobalButton(onTap: () {}, text: "Каталог")
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
