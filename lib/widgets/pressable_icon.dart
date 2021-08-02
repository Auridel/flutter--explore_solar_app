import 'package:flutter/material.dart';

class PressableIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function(BuildContext ctx) _onPress;

  PressableIcon(this.icon, this.color, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white12,
      ),
      child: IconButton(
        alignment: Alignment.center,
        icon: Icon(
          icon,
          color: color,
        ),
        onPressed: () {
          print('sdasdsadsadasds');
          _onPress(context);
        },
      ),
    );
  }
}
