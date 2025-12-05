import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/cache_helper.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState()) {
    _loadTheme();
  }
  static const String _themeCacheKey = 'isDarkTheme';
  bool isDark = false;

  Future<void> _loadTheme() async {
    isDark = CacheHelper().getBool(key: _themeCacheKey) ?? false;
    emit(state.copyWith(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }

  Future<void> setTheme() async {
    isDark = !isDark;
    await CacheHelper().saveData(key: _themeCacheKey, value: isDark);
    emit(state.copyWith(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }
}
