import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minecraft_bugsmakers/resources/app_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.iconAsset,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String iconAsset;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 14,
                )
              ],
            ),
            child: SvgPicture.asset(
              iconAsset,
              height: 41,
              width: 41,
            ),
          ),
          SizedBox(
            width: 12.sp,
          ),
          Text(
            text,
            style: AppStyles.poppins,
          )
        ],
      ),
    );
  }
}