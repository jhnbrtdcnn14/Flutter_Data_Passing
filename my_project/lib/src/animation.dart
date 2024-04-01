import 'package:flutter/material.dart';

import '../bloc/navigation_state.dart';

class StateChecker {
  Widget checkState(dynamic state, Animation<double> animation, Widget child) {
    if (state is MenuState) {
      // Check if the state is MenuState, then slide from left to right
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-2.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    } else {
      // Otherwise, continue with the fade transition
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  }
}
