import 'dart:async';
import 'package:flutter/material.dart';

class SessionTimeoutListener extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback onTimeout;

  const SessionTimeoutListener({
    super.key,
    required this.child,
    required this.duration,
    required this.onTimeout,
  });

  @override
  State<SessionTimeoutListener> createState() => _SessionTimeoutListenerState();
}

class _SessionTimeoutListenerState extends State<SessionTimeoutListener> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(widget.duration, widget.onTimeout);
  }

  void _resetTimer() {
    // Only reset if the timer is active (not already timed out)
    // Actually, if we are here, the widget is still built.
    // Ideally we shouldn't reset if we are already in the process of timing out/navigating?
    // But since onTimeout navigates away, this widget might be unmounted or covered.
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _resetTimer(),
      onPointerMove: (_) => _resetTimer(),
      onPointerUp: (_) => _resetTimer(),
      // You can add more events like onPointerHover for web/desktop if needed
      child: widget.child,
    );
  }
}
