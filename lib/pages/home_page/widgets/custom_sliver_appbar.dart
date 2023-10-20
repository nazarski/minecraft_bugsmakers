import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/generated/l10n.dart';
import 'package:minecraft_bugsmakers/models/category_model.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';
import 'package:minecraft_bugsmakers/resources/app_styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.categories,
    required this.scaffoldKey,
  });

  final List<CategoryModel> categories;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final S tr = S.of(context);
    return SliverAppBar(
      centerTitle: false,
      pinned: true,
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu_rounded,
          color: AppColors.green,
          size: 36.sp,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      titleTextStyle: TextStyle(
        color: AppColors.green,
        fontFamily: 'BungeeColor',
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      title: Text(tr.explore),
      bottom: TabBar(
        padding: EdgeInsets.symmetric(vertical: 6.sp),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.green,
        ),
        isScrollable: true,
        overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
        labelColor: Colors.white,
        labelStyle: AppStyles.poppins.copyWith(fontSize: 14.sp),
        unselectedLabelStyle: AppStyles.prompt,
        tabs: List.generate(categories.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
            child: Text(categories[index].title),
          );
        }),
      ),
    );
  }
}
