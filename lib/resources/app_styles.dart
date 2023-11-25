import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';

class AppStyles {
  static const TextStyle bungee = TextStyle(
    fontFamily: 'BungeeColor',
    fontWeight: FontWeight.bold,
    color: AppColors.green,
    height: 1.1,
  );

  static const TextStyle prompt = TextStyle(
    color: Colors.white,
    fontFamily: 'Prompt',
    fontWeight: FontWeight.w300,
    height: 1.1,
  );

  static const TextStyle poppins = TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const TextStyle poppinsBlack = TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle promptBody = TextStyle(
    color: Colors.black,
    fontFamily: 'Prompt',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle promptTitle = TextStyle(
    color: Colors.black,
    fontFamily: 'Prompt',
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static ButtonStyle greenButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.green,
    disabledBackgroundColor: Colors.grey,
    textStyle: AppStyles.poppins.copyWith(fontSize: 24.sp),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.sp),
    ),
  );
}
