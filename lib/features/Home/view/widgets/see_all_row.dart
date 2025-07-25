import 'package:flutter/material.dart';

class RowSeeAll extends StatelessWidget {
  const RowSeeAll({
    super.key,
    required this.title,
    this.textColor,
    this.onTap,
  });

  final String title;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        )
      ],
    );
  }
}
