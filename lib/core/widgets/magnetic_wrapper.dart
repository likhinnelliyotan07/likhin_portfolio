import 'package:flutter/material.dart';

class MagneticWrapper extends StatefulWidget {
  final Widget child;
  final double intensity; // How much it moves (0 to 1)

  const MagneticWrapper({
    super.key,
    required this.child,
    this.intensity = 0.2,
  });

  @override
  State<MagneticWrapper> createState() => _MagneticWrapperState();
}

class _MagneticWrapperState extends State<MagneticWrapper> {
  final GlobalKey _key = GlobalKey();
  Offset _translation = Offset.zero;

  void _onHover(PointerEvent event) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final size = renderBox.size;
      final localPosition = renderBox.globalToLocal(event.position);

      final centerX = size.width / 2;
      final centerY = size.height / 2;

      // Distance from center
      final dx = localPosition.dx - centerX;
      final dy = localPosition.dy - centerY;

      setState(() {
        _translation = Offset(dx * widget.intensity, dy * widget.intensity);
      });
    }
  }

  void _onExit(PointerEvent event) {
    setState(() {
      _translation = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      child: AnimatedContainer(
        key: _key,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        transform: Matrix4.translationValues(_translation.dx, _translation.dy, 0),
        child: widget.child,
      ),
    );
  }
}
