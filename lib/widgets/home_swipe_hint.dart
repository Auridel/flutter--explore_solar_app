import 'package:flutter/material.dart';

class HomeSwipeHint extends StatefulWidget {
  const HomeSwipeHint({Key? key}) : super(key: key);

  @override
  _HomeSwipeHintState createState() => _HomeSwipeHintState();
}

class _HomeSwipeHintState extends State<HomeSwipeHint>
    with TickerProviderStateMixin {
  late final AnimationController _offsetController;
  late final Animation<Offset> _offsetAnimation;
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    _offsetController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..repeat(reverse: true);
    _fadeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..forward();
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0.0, -15.0), end: Offset(0.0, 15.0))
            .animate(_offsetController);
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _offsetAnimation.value,
      child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset('assets/images/swipe.png', height: 60,)),
    );
  }
}
