import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:example_app/ui/tabs/home/widgets/my_transformer.dart';
import 'package:example_app/ui/tabs/home/widgets/page_icon.dart';
import 'package:example_app/utils/constans.dart';
import 'package:example_app/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/cubit/timer_cubit.dart';
import '../../../../utils/colors.dart';
import 'item_view.dart';

class ShowPageView extends StatefulWidget {
  const ShowPageView({super.key});

  @override
  State<ShowPageView> createState() => _ShowPageViewState();
}

class _ShowPageViewState extends State<ShowPageView> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                "Товар дня",
                style: TextStyle(
                  fontSize: 22.spMax,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans",
                ),
              ),
              const Spacer(),
              BlocBuilder<TimerCubit, int>(
                builder: (context, state) {
                  final hours = state ~/ 3600;
                  final minutes = (state % 3600) ~/ 60;
                  final seconds = state % 60;
                  return Text(
                    '${hours + 23} : ${minutes <= 9 ? 0 : ""}$minutes : ${seconds <= 9 ? 0 : ""}$seconds',
                    style: TextStyle(
                      fontSize: 15.spMax,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans",
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        18.ph,
        Container(
          height: 340.h,
          margin: EdgeInsets.only(right: 6.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: TransformerPageView(
            onPageChanged: (index) {
              setState(() {
                pageIndex = index!;
              });
            },
            physics: const BouncingScrollPhysics(),
            itemCount: names.length,
            itemBuilder: (context, index) => ItemView(
              name: names[index],
              oldPrise: oldPrises[index],
              prise: prises[index],
              image: images[index],
            ),
            scrollDirection: Axis.horizontal,
            transformer: MyTransformer(),
          ),
        ),
        11.ph,
        PageIndexItem(activePageIndex: pageIndex),
        26.ph,
      ],
    );
  }
}
