import 'package:easy_localization/easy_localization.dart';
import 'package:example_app/data/bloc/tabs_bloc/tabs_event.dart';
import 'package:example_app/data/bloc/tabs_bloc/tabs_state.dart';
import 'package:example_app/ui/tabs/basket/basket_screen.dart';
import 'package:example_app/ui/tabs/catalog/catalog_screen.dart';
import 'package:example_app/ui/tabs/favorite/favorite_screen.dart';
import 'package:example_app/ui/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/bloc/tabs_bloc/tabs_bloc.dart';
import '../../utils/colors.dart';
import '../../utils/svges.dart';
import 'home/home_screen.dart';

class TabsScreen extends StatelessWidget {
  TabsScreen({super.key});

  final List<Widget> pages = [
    const HomeScreen(),
    const CatalogScreen(),
    const BasketScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(builder: (context, state) {
      return Scaffold(
        body: IndexedStack(
          index: state.currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (index) {
            context.read<BottomNavigationBloc>().add(UpdateBottomNavigationIndex(index));
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.orange,
          unselectedItemColor: AppColors.grey,
          selectedLabelStyle: TextStyle(fontSize: 12.spMin, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
          unselectedLabelStyle: TextStyle(fontSize: 12.spMin, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
          items: [
            BottomNavigationBarItem(icon: state.currentIndex == 0 ? SvgPicture.asset(AppIcons.home, color: AppColors.orange) : SvgPicture.asset(AppIcons.home, color: AppColors.grey), label: tr("Главная")),
            BottomNavigationBarItem(icon: state.currentIndex == 1 ? SvgPicture.asset(AppIcons.catalog, color: AppColors.orange) : SvgPicture.asset(AppIcons.catalog), label: tr("Каталог")),
            BottomNavigationBarItem(icon: state.currentIndex == 2 ? SvgPicture.asset(AppIcons.basketOut, color: AppColors.orange) : SvgPicture.asset(AppIcons.basketOut), label: tr("Корзина")),
            BottomNavigationBarItem(icon: state.currentIndex == 3 ? SvgPicture.asset(AppIcons.favorite, color: AppColors.orange) : SvgPicture.asset(AppIcons.favorite), label: tr("Избранное")),
            BottomNavigationBarItem(icon: state.currentIndex == 4 ? SvgPicture.asset(AppIcons.tabProfile, color: AppColors.orange) : SvgPicture.asset(AppIcons.tabProfile), label: tr("Профиль")),
          ],
        ),
      );
    });
  }
}
