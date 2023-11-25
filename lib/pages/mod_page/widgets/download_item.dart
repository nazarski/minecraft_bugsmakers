import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/models/download_model.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';

class DownloadItem extends StatelessWidget {
  const DownloadItem({Key? key, required this.downloadModel, required this.isShow}) : super(key: key);
  final DownloadModel downloadModel;
  final bool isShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                color: Colors.white.withOpacity(.5),
                border: Border.all(color: AppColors.green, width: 3.sp)),
            child: Image.asset(
              isShow ? Assets.images.soulTorch.path : Assets.images.torch.path,
              height: 32.sp,
            ),
          )
        ],
      ),
    );
  }
}