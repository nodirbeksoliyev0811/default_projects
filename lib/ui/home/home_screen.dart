import 'package:default_project/utils/colors.dart';
import 'package:default_project/utils/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/network/api_provider.dart';
import '../../data/network/api_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PrayerRepository prayerRepository =
      PrayerRepository.prayerRepository(apiProvider: ApiProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c180B37,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.background,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.sp),
            child: FutureBuilder(
              future: prayerRepository.fetchPrayerInfo("Quva"),
              builder: (
                BuildContext context,
                snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(backgroundColor: AppColors.c9543FF,),
                  );
                } else if (snapshot.hasData) {
                  var prayerData = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {},
                        child: ListTile(
                          title: Text(
                            prayerData.region,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          subtitle: Text(
                            prayerData.date,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 35.sp,
                            ),
                          ),
                          trailing: Text(
                            prayerData.weekday,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(prayerData.times.tong),
                      Text(prayerData.times.quyosh),
                      Text(prayerData.times.peshin),
                      Text(prayerData.times.asr),
                      Text(prayerData.times.shom),
                      Text(prayerData.times.hufton),
                    ],
                  );
                }
                return const Center(child: Text("Not Found"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
