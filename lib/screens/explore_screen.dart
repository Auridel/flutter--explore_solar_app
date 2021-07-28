import 'package:explore_solar_app/widgets/planet_slider.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff194fa5),
                Color(0xff8a59b4),
              ]
            )
          ),
          child: Container(
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
                PlanetSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
