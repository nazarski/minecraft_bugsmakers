import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/bloc/localization_bloc/localization_bloc.dart';
import 'package:minecraft_bugsmakers/bloc/mod_list/mod_list_bloc.dart';
import 'package:minecraft_bugsmakers/routes/app_router.dart';

import 'generated/l10n.dart';

void main() {
  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 667),
      builder: (BuildContext context, Widget? child) {
        return const MineCraftModsApp();
      },
    ),
  );
}

class MineCraftModsApp extends StatelessWidget {
  const MineCraftModsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => ModListBloc()..add(GetAllMods()),
        ),
        BlocProvider(
          create: (context) => LocalizationBloc(),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            onGenerateRoute: AppRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
