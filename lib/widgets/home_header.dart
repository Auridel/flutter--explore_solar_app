import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  final String _text;
  final double _fontSize;
  final Duration _duration;
  final Duration _animationDelay;
  final String _heroTag;

  HomeHeader(this._text, this._fontSize, this._duration, this._animationDelay, this._heroTag);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget._duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0.0, -10.0), end: Offset(0.0, 0.0))
            .animate(_controller);
    Future.delayed(widget._animationDelay, () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _animation,
        child: Hero(
          tag: widget._heroTag,
          child: Text(
            widget._text,
            style: TextStyle(
                fontSize: widget._fontSize,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontFamily: 'sans-serif'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
