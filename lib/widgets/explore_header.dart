import 'package:flutter/material.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore',
            style: theme.textTheme.headline6,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text('Solar system', style: theme.primaryTextTheme.headline4,),
              SizedBox(width: 5,),
              Icon(Icons.keyboard_arrow_down_sharp, color: Color(0xffea8ec1),)
            ],
          ),
        ],
      ),
    );
  }
}
