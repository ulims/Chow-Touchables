import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TouchableOpacity extends StatefulWidget {
  TouchableOpacity({
    super.key,
    required this.child,
    this.activeOpacity = 0.2,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.borderRadius = 8,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    // ignore: duplicate_ignore
    // ignore: unnecessary_null_comparison
  })  : assert(excludeFromSemantics != null),
        // ignore: unnecessary_null_comparison
        assert(dragStartBehavior != null),
        assert(() {
          final bool haveVerticalDrag = onVerticalDragStart != null ||
              onVerticalDragUpdate != null ||
              onVerticalDragEnd != null;
          final bool haveHorizontalDrag = onHorizontalDragStart != null ||
              onHorizontalDragUpdate != null ||
              onHorizontalDragEnd != null;
          final bool havePan =
              onPanStart != null || onPanUpdate != null || onPanEnd != null;
          final bool haveScale = onScaleStart != null ||
              onScaleUpdate != null ||
              onScaleEnd != null;
          if (havePan || haveScale) {
            if (havePan && haveScale) {
              throw FlutterError('Incorrect TouchableOpacity arguments.\n'
                  'Having both a pan gesture recognizer and a scale gesture recognizer is redundant; scale is a superset of pan. Just use the scale gesture recognizer.');
            }
            final String recognizer = havePan ? 'pan' : 'scale';
            if (haveVerticalDrag && haveHorizontalDrag) {
              throw FlutterError('Incorrect TouchableOpacity arguments.\n'
                  'Simultaneously having a vertical drag gesture recognizer, a horizontal drag gesture recognizer, and a $recognizer gesture recognizer '
                  'will result in the $recognizer gesture recognizer being ignored, since the other two will catch all drags.');
            }
          }
          return true;
        }());

  @override
  State<StatefulWidget> createState() {
    return _TouchableOpacityState();
  }

  final Widget child;
  final double borderRadius;
  final double activeOpacity;

  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;

  final GestureTapCallback? onTap;

  final GestureTapCancelCallback? onTapCancel;

  final GestureTapCallback? onDoubleTap;

  final GestureLongPressCallback? onLongPress;

  final GestureLongPressStartCallback? onLongPressStart;

  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  final GestureLongPressUpCallback? onLongPressUp;

  final GestureLongPressEndCallback? onLongPressEnd;

  final GestureDragDownCallback? onVerticalDragDown;

  final GestureDragStartCallback? onVerticalDragStart;

  final GestureDragUpdateCallback? onVerticalDragUpdate;

  final GestureDragEndCallback? onVerticalDragEnd;

  final GestureDragCancelCallback? onVerticalDragCancel;

  final GestureDragDownCallback? onHorizontalDragDown;

  final GestureDragStartCallback? onHorizontalDragStart;

  final GestureDragUpdateCallback? onHorizontalDragUpdate;

  final GestureDragEndCallback? onHorizontalDragEnd;

  final GestureDragCancelCallback? onHorizontalDragCancel;

  final GestureDragDownCallback? onPanDown;

  final GestureDragStartCallback? onPanStart;

  final GestureDragUpdateCallback? onPanUpdate;

  final GestureDragEndCallback? onPanEnd;
  final GestureDragCancelCallback? onPanCancel;

  final GestureScaleStartCallback? onScaleStart;

  final GestureScaleUpdateCallback? onScaleUpdate;

  final GestureScaleEndCallback? onScaleEnd;

  final GestureForcePressStartCallback? onForcePressStart;

  final GestureForcePressPeakCallback? onForcePressPeak;

  final GestureForcePressUpdateCallback? onForcePressUpdate;

  final GestureForcePressEndCallback? onForcePressEnd;

  final HitTestBehavior? behavior;

  final bool excludeFromSemantics;

  final DragStartBehavior dragStartBehavior;
}

class _TouchableOpacityState extends State<TouchableOpacity>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 100),
        lowerBound: widget.activeOpacity,
        upperBound: 1.0,
        value: 1.0);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onTap,
      onTapCancel: _onTapCancel,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      excludeFromSemantics: widget.excludeFromSemantics,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Opacity(
        opacity: _controller.value,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.activeOpacity != 1.0) {
      _controller.reverse();
    }
    if (widget.onTapDown != null) {
      widget.onTapDown!(details);
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.activeOpacity != 1.0) {
      _controller.forward();
    }
    if (widget.onTapUp != null) {
      widget.onTapUp!(details);
    }
  }

  void _onTapCancel() {
    if (widget.activeOpacity != 1.0) {
      _controller.forward();
    }
    if (widget.onTapCancel != null) {
      widget.onTapCancel!();
    }
  }
}


