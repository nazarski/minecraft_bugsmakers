import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:minecraft_bugsmakers/bloc/mod_list/mod_list_bloc.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/models/mod_model.dart';
import 'package:minecraft_bugsmakers/pages/home_page/widgets/app_drawer.dart';
import 'package:minecraft_bugsmakers/pages/home_page/widgets/custom_sliver_appbar.dart';
import 'package:minecraft_bugsmakers/pages/home_page/widgets/mod_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const routeName = 'home_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModListBloc, ModListState>(
      builder: (context, state) {
        final categories = state.categories;
        return DefaultTabController(
          length: categories.length,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.stone.provider(),
                repeat: ImageRepeat.repeat,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              drawer: const AppDrawer(),
              body: NestedScrollView(
                scrollDirection: Axis.vertical,
                headerSliverBuilder: (
                  BuildContext context,
                  bool innerBoxIsScrolled,
                ) {
                  return [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: CustomSliverAppBar(
                        categories: categories,
                        scaffoldKey: _scaffoldKey,
                      ),
                    ),
                  ];
                },
                body: Padding(
                  padding: EdgeInsets.only(top: 75.h),
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(categories.length, (index) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.sp, vertical: 24.sp),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          axisDirection: AxisDirection.down,
                          crossAxisSpacing: 16.sp,
                          mainAxisSpacing: 16.sp,
                          children: [
                            for (ModModel mod in categories[index].modList)
                              StaggeredGridTile.extent(
                                crossAxisCellCount: 1,
                                mainAxisExtent: 240.h,
                                child: ModItem(
                                  modItem: mod,
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
