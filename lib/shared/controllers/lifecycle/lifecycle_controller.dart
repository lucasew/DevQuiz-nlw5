import 'package:flutter/material.dart';

class LifecycleController<L extends Lifecycle> extends StatefulWidget {
    final Widget child;
    final L lifecycle;
    LifecycleController({required this.child, required this.lifecycle, Key? key}) : super(key: key);

    _LifecycleControllerState createState() => _LifecycleControllerState();

}

class _LifecycleControllerState<L extends Lifecycle> extends State<LifecycleController<L>> {
    Widget build(BuildContext context) {
        widget.lifecycle.up(context);
        return widget.child;
    }
    void dispose() {
        super.dispose();
        widget.lifecycle.down();
    }
}

abstract class Lifecycle {
    void up(BuildContext context) {}
    void down() {}
}
