import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tab_provider.dart';
import '../utils/colors.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({super.key});

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabProvider>(context, listen: true);
    return Scaffold(
      body: IndexedStack(
        index: provider.activeIndex,
        children: provider.screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: provider.activeIndex,
        color: Colors.blue,
        height: 60,
        backgroundColor: AppColors.white,
        items: const [
          Icon(Icons.fiber_manual_record_sharp, color: AppColors.white),
          Icon(Icons.fiber_manual_record_sharp, color: AppColors.white),
        ],
        onTap: (index) {
          provider.checkIndex(index);
        },
      ),
    );
  }
}
