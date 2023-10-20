import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/models/mod_model.dart';
import 'package:minecraft_bugsmakers/pages/mod_page/mod_page.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';
import 'package:minecraft_bugsmakers/resources/app_styles.dart';

class ModItem extends StatelessWidget {
  const ModItem({Key? key, required this.modItem}) : super(key: key);
  final ModModel modItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.sp,
        vertical: 12.sp,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.all(Radius.circular(24.sp)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.sp,
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: modItem.preview,
              height: 104.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  modItem.title,
                  style: AppStyles.poppins
                      .copyWith(fontSize: 14, color: AppColors.darkBlue),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 8.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.sp,
                  vertical: 4.sp,
                ),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12.sp,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      getRandomNumberString(),
                      style: AppStyles.poppins.copyWith(fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            modItem.description,
            style: AppStyles.prompt.copyWith(fontSize: 12, color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.green),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ModPage.routeName, arguments: modItem);
            },
            child: const Text('Download'),
          )
        ],
      ),
    );
  }
}

String getRandomNumberString() {
  double randomValue = Random().nextDouble() * (5.0 - 4.1) + 4.1;
  return randomValue.toStringAsFixed(1);
}
