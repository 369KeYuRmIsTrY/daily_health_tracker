// lib/widgets/fade_in_card.dart
import 'package:flutter/material.dart';

class FadeInCard extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const FadeInCard({Key? key, required this.child, this.duration = const Duration(milliseconds: 450)}) : super(key: key);

  @override
  State<FadeInCard> createState() => _FadeInCardState();
}

class _FadeInCardState extends State<FadeInCard> with SingleTickerProviderStateMixin {
  late final AnimationController _ac;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(vsync: this, duration: widget.duration);
    _anim = CurvedAnimation(parent: _ac, curve: Curves.easeOut);
    _ac.forward();
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _anim,
      child: ScaleTransition(scale: _anim, child: widget.child),
    );
  }
}
