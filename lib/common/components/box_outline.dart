import 'package:flutter/material.dart';

class BoxOutline extends StatelessWidget {
  const BoxOutline({
    super.key,
    required Size size,
    required Widget child,
    Color? backGroundColor,
  })  : _size = size,
        _child = child,
        _backGroundColor = backGroundColor ?? Colors.white;

  final Size _size;
  final Widget _child;
  final Color _backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.directional(
          textDirection: TextDirection.ltr,
          start: 3,
          top: 4,
          child: Container(
            width: _size.width,
            height: _size.height,
            decoration: BoxDecoration(
              color: _backGroundColor,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox.fromSize(size: Size.copy(_size), child: _child),
      ],
    );
  }
}
