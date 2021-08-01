import 'package:flutter/material.dart';

class KnowMore extends StatefulWidget {
  const KnowMore({Key? key}) : super(key: key);

  @override
  _KnowMoreState createState() => _KnowMoreState();
}

class _KnowMoreState extends State<KnowMore> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
    _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.3, 0.0)).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text('Know more', style: theme.primaryTextTheme.headline2,),
        SlideTransition(
          position: _animation,
            child: Icon(Icons.arrow_right_alt, color: Color(0xfff2b4b7),)
        ),
      ],
    );
  }
}
