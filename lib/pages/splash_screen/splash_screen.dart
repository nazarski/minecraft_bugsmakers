import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/generated/l10n.dart';
import 'package:minecraft_bugsmakers/pages/home_page/home_page.dart';
import 'package:minecraft_bugsmakers/resources/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final S tr = S.of(context);
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.stone.image(
              repeat: ImageRepeat.repeat,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 42.h, left: 45, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.lets,
                      style: AppStyles.prompt.copyWith(fontSize: 25.sp),
                    ),
                    Text(
                      tr.explore,
                      style: AppStyles.bungee.copyWith(fontSize: 64.sp),
                    ),
                    Text(
                      tr.newMods,
                      style: AppStyles.prompt.copyWith(fontSize: 25.sp),
                    ),
                    SizedBox(
                      width: 239.w,
                      child: Text(
                        tr.modsAwesome,
                        style: AppStyles.prompt
                            .copyWith(fontSize: 10.sp, height: 1.6),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomePage.routeName, (route) => false);
                  },
                  style: AppStyles.greenButton,
                  child: const Text('LET’S GO!'),
                ),
              ),
              Expanded(
                flex: 15,
                child: Assets.images.creeper.image(
                  width: double.infinity,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
