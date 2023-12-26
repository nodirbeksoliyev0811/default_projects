import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class GlobalSliver extends StatefulWidget {
  const GlobalSliver({
    super.key,
    required this.body,
    required this.content,
  });

  final Widget content;
  final Widget body;

  @override
  State<GlobalSliver> createState() => _GlobalSliverState();
}

class _GlobalSliverState extends State<GlobalSliver> {

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 243.h,
            backgroundColor: AppColors.background,
            floating: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: widget.content,
            ),
          ),
        ];
      },
      body: widget.body,
    );
  }
}