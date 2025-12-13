import 'package:fintech_app/core/app/cubits/theme_cubit.dart';
import 'package:fintech_app/core/app/cubits/theme_state.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:fintech_app/core/theme/app_theme.dart';
import 'package:fintech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FintechApp extends StatelessWidget {
  const FintechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return BlocProvider(
                create: (_) => AuthCubit(),
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: state.themeMode,
                  routerConfig: AppRouter.router,
                  themeAnimationStyle:
                  const AnimationStyle(curve: Curves.easeInOut),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
