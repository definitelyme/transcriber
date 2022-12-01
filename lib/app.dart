library app.dart;

import 'package:auto_route/auto_route.dart';
import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/managers/navigation/navigation.dart';
import 'package:transcriber/managers/theme/theme.dart';
import 'package:transcriber/utils/utils.dart';

/// A stateless widget to render AppView.
class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (_, app) => PlatformApp.router(
          title: Const.appName,
          debugShowCheckedModeBanner: kDebugMode,
          useInheritedMediaQuery: true,
          routeInformationParser: router.defaultRouteParser(),
          material: (_, __) => MaterialAppRouterData(
            theme: app.themeData(),
            darkTheme: AppTheme.dark().themeData(),
            themeMode: app.themeMode,
            scaffoldMessengerKey: scaffoldMessagerKey,
          ),
          cupertino: (c, __) => CupertinoAppRouterData(
            theme: app.cupertinoThemeData(c),
            color: Palette.primaryColor,
          ),
          routerDelegate: AutoRouterDelegate(
            router,
            navigatorObservers: () => <NavigatorObserver>[AutoRouteObserver()],
          ),
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          builder: (_, widget) => ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            useInheritedMediaQuery: true,
            child: widget,
            builder: (_, child) => child!,
          ),
        ),
      ),
    );
  }
}
