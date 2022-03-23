import 'package:flutter/material.dart';

class PageDot extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  const PageDot({Key? key, required this.isSelected, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor:
            isSelected ? Theme.of(context).primaryColor : Colors.white60,
        radius: 5.5,
      ));
}
