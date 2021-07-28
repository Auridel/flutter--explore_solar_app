import 'package:explore_solar_app/slide_bloc/slide_bloc.dart';
import 'package:flutter/material.dart';

class DotsNavigation extends StatefulWidget {
  final int routeCount;

  DotsNavigation(this.routeCount);

  @override
  _DotsNavigationState createState() => _DotsNavigationState();
}

class _DotsNavigationState extends State<DotsNavigation> {
  final _sliderBloc = SlideBloc.getInstance();
  late Stream<int> _sliderStream;

  @override
  void initState() {
    _sliderStream = _sliderBloc.slideStream;
    super.initState();
  }

  @override
  void dispose() {
    _sliderBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: size.width,
      child: StreamBuilder<int>(
        stream: _sliderStream,
        initialData: 0,
        builder: (ctx, snapshot) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.routeCount,
              (index) {
                final isCurrent = snapshot.data == index;
                return Padding(
                  padding: const EdgeInsets.all(7),
                  child: Icon(
                    Icons.circle,
                    color: isCurrent ? Colors.white : Colors.white54,
                    size: isCurrent ? 7 : 5,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
