// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.child, required this.onPressed}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _down() => setState(() => _scale = 0.95);
  void _up() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _down(),
      onTapUp: (_) {
        _up();
        widget.onPressed();
      },
      onTapCancel: _up,
      child: Transform.scale(scale: _scale, child: widget.child),
    );
  }
}
