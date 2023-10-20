import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/generated/l10n.dart';
import 'package:minecraft_bugsmakers/pages/home_page/widgets/drawer_item.dart';
import 'package:minecraft_bugsmakers/pages/widgets/generic_dialog.dart';
import 'package:minecraft_bugsmakers/pages/widgets/review_dialog.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final S tr = S.of(context);
    return SafeArea(
      bottom: false,
      child: Drawer(
        width: double.infinity,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(right: 100.sp),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50.sp),
                    ),
                    image: DecorationImage(
                      image: Assets.images.earth.provider(),
                      repeat: ImageRepeat.repeat,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.sp),
              child: Column(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  DrawerItem(
                    iconAsset: Assets.icons.diamond.path,
                    text: tr.likeThisApp,
                    onTap: () {
                      const ReviewDialog().show(context);
                    },
                  ),
                  const Spacer(),
                  DrawerItem(
                    iconAsset: Assets.icons.sheet.path,
                    text: tr.privacy,
                    onTap: () {},
                  ),
                  const Spacer(),
                  DrawerItem(
                    iconAsset: Assets.icons.book.path,
                    text: tr.instruction,
                    onTap: () {},
                  ),
                  const Spacer(
                    flex: 12,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Assets.images.ender.image(),
            )
          ],
        ),
      ),
    );
  }
}
