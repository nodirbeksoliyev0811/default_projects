import 'dart:async';

import 'package:default_project/ui/home/widgets/list_tile_widget.dart';
import 'package:default_project/utils/colors.dart';
import 'package:default_project/utils/images.dart';
import 'package:default_project/utils/svges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/network/api_provider.dart';
import '../../data/network/api_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String _timeString = "";
late Timer _timer;

class _HomeScreenState extends State<HomeScreen> {
  final PrayerRepository prayerRepository =
      PrayerRepository.prayerRepository(apiProvider: ApiProvider());

  // late PrayerInfoModel prayerInfoModel;
  //
  // Future getProduct() async{
  //   Uri uri = Uri.parse("${BaseUrl().baseUrl}/api/present/day?region=Toshkent");
  //   final response = await http.get(uri);
  //   if(response.statusCode == 200){
  //     prayerInfoModel = PrayerInfoModel.fromJson(jsonDecode(response.body));
  //   }
  //   return prayerInfoModel;
  // }

  void _init(Timer timer){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeString = DateTime.now().toString();
      });
    });
  }

  @override
  void initState() {
    // getProduct();
    super.initState();
  }

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
              future: prayerRepository.fetchPrayerInfo("Toshkent"),
              // getProduct(),
              builder: (
                BuildContext context,
                snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      backgroundColor: AppColors.c9543FF,
                    ),
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
                              fontSize: 30.sp,
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
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     // Text(_timeString)
                      //   ],
                      // ),
                      Text(_timeString),
                      const Spacer(),
                      Container(
                        height: 51.h,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ZoomTapAnimation(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  prayerData.date,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.sp,
                                  ),
                                ),
                                ZoomTapAnimation(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      ListTileWidget(
                          icon: AppIcons.tong,
                          title: "Tong",
                          time: prayerData.times.tong),
                      ListTileWidget(
                          icon: AppIcons.quyosh,
                          title: "Quyosh",
                          time: prayerData.times.quyosh),
                      ListTileWidget(
                          icon: AppIcons.quyosh,
                          title: "Peshin",
                          time: prayerData.times.peshin),
                      ListTileWidget(
                          icon: AppIcons.tong,
                          title: "Asr",
                          time: prayerData.times.asr),
                      ListTileWidget(
                          icon: AppIcons.shom,
                          title: "Shom",
                          time: prayerData.times.shom),
                      ListTileWidget(
                          icon: AppIcons.shom,
                          title: "Hufton",
                          time: prayerData.times.hufton),
                    ],
                  );
                }
                return const Center(child: Text(""));
              },
            ),
          ),
        ],
      ),
    );
  }
}
