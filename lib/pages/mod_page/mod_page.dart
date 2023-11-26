import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/models/how_to_use_item_model.dart';
import 'package:minecraft_bugsmakers/models/mod_model.dart';
import 'package:minecraft_bugsmakers/pages/mod_page/widgets/download_item.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';
import 'package:minecraft_bugsmakers/resources/app_styles.dart';

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
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.stone1.provider(),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            CachedNetworkImage(
              imageUrl: mod.preview,
              height: 320.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(36),
                  ),
                  color: Colors.white.withOpacity(.9),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      mod.title,
                      style: AppStyles.bungee.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      mod.description,
                      style: AppStyles.poppinsBlack,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (mod.howToUse.isNotEmpty)
                      ...List.generate(mod.howToUse.length, (index) {
                        return HowToUseItemWidget(howToUse: mod.howToUse[index]);
                      }),
                    ...List.generate(mod.modsPath.length, (index) {
                      return DownloadItem(
                        downloadModel: mod.modsPath[index],
                        isShow: index.isEven,
                      );
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HowToUseItemWidget extends StatelessWidget {
  const HowToUseItemWidget({
    super.key,
    required this.howToUse,
  });

  final HowToUseItemModel howToUse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (howToUse.description != null)
          Text(
            howToUse.description!,
            style: AppStyles.promptTitle,
          ),
        if (howToUse.image != null) ...[
          const SizedBox(
            height: 12,
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: howToUse.image!,
            ),
          ),
        ],
        if (howToUse.instructions != null) ...[
          const SizedBox(
            height: 12,
          ),
          Text(
            howToUse.instructions!,
            style: AppStyles.promptBody,
          ),
        ],
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ],
    );
  }
}
