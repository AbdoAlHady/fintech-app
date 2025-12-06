import 'dart:ui';
import 'package:flutter/material.dart';

class AppBlurManager extends StatefulWidget {
  final Widget child;

  const AppBlurManager({super.key, required this.child});

  @override
  State<AppBlurManager> createState() => _AppBlurManagerState();
}

class _AppBlurManagerState extends State<AppBlurManager>
    with WidgetsBindingObserver {
  bool _isBlurVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      // App going to background
      setState(() => _isBlurVisible = true);
    } else if (state == AppLifecycleState.resumed) {
      // App returned to foreground
      setState(() => _isBlurVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isBlurVisible)
          Positioned.fill(
            child: Container(
              color: Colors.grey.withAlpha(51),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(color: Colors.white.withAlpha(26)),
              ),
            ),
          ),
      ],
    );
  }
}
