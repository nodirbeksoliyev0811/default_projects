import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget(
      {super.key, required this.icon, required this.title, required this.time});

  final String icon;
  final String title;
  final String time;

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: SvgPicture.asset(widget.icon,height: 50,width: 50,),
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Text(
        widget.time,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
