import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/models/download_model.dart';
import 'package:minecraft_bugsmakers/models/mod_model.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';

class ModPage extends StatelessWidget {
  const ModPage({Key? key, required this.mod}) : super(key: key);
  static const String routeName = 'mod-page';
  final ModModel mod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 74.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: DecoratedBox(
            decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(12.sp)),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: mod.preview,
              height: 320.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(mod.title),
            SizedBox(
              height: 24.h,
            ),
            Text(mod.description),
            SizedBox(
              height: 24.h,
            ),
            if (mod.howToUse.isNotEmpty)
              Center(
                child: CachedNetworkImage(
                  imageUrl: mod.howToUse,
                  height: 320.h,
                ),
              ),
            ...List.generate(mod.modsPath.length, (index) {
              return DownloadItem(
                downloadModel: mod.modsPath[index],
                isShow: index.isEven,
              );
            })
          ],
        ),
      ),
    );
  }
}

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
