import 'package:example_app/ui/tabs/tabs_screen.dart';
import 'package:example_app/utils/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/bloc/tabs_bloc/tabs_bloc.dart';
import 'data/cubit/timer_cubit.dart';

Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'EN'),
      Locale('uz', 'UZ'),
      Locale('ru', 'RU'),
    ],
    fallbackLocale: const Locale('uz','UZ'),
    path: 'assets/translations',
    child: const MyApp(),  ) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<BottomNavigationBloc>(
                create: (context) => BottomNavigationBloc(),
              ),
              BlocProvider<TimerCubit>(
                create: (context) => TimerCubit(),
              ),
            ],
            child: TabsScreen(),
          ),
        );
      },
    );
  }
}


// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'data/cubit/timer_cubit.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final TimerCubit timerCubit = TimerCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => timerCubit,
//         child: MyTimerScreen(),
//       ),
//     );
//   }
// }
//
// class MyTimerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Random random = Random();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Timer App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BlocBuilder<TimerCubit, int>(
//               builder: (context, state) {
//                 final hours = state ~/ 3600;
//                 final minutes = (state % 3600) ~/ 60;
//                 final seconds = state % 60;
//
//                 return Text(
//                   '$hours:$minutes:$seconds',
//                   style: TextStyle(fontSize: 36),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             Text("${random.nextInt(50)}"),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<TimerCubit>().startTimer();
//               },
//               child: Text('Start Timer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
