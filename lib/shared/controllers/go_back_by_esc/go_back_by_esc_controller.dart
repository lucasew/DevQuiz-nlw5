import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import '../lifecycle/lifecycle_controller.dart';

class GoBackByEscController extends StatelessWidget {
  final Widget child;
  GoBackByEscController({required this.child});

  Widget build(BuildContext context) {
    return LifecycleController(child: child, lifecycle: _GoBackEscLifecycle());
  }
}

class _GoBackEscLifecycle extends Lifecycle {
  BuildContext? context;
  _GoBackEscLifecycle() : super();

  void up(BuildContext context) {
    print("up");
    this.context = context;
    RawKeyboard.instance.addListener(_handleKeyDown);
  }

  void down() {
    print("down");
    RawKeyboard.instance.removeListener(_handleKeyDown);
  }

  void _handleKeyDown(RawKeyEvent key) {
    if (context == null) {
      return;
    }
    if (key.isKeyPressed(LogicalKeyboardKey.escape)) {
      Navigator.pop(context as BuildContext);
    }
  }
}
