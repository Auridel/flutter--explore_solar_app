import 'package:explore_solar_app/models/planet.dart';
import 'package:explore_solar_app/widgets/know_more_animated.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final Planet _planet;

  const SliderCard({Key? key, required Planet planet})
      : this._planet = planet,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          width: size.width - 30,
          child: Container(
            clipBehavior: Clip.none,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 70,),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (_planet.num != 0)
                      Positioned(
                        bottom: 35,
                        right: 25,
                        child: Text(
                          '${_planet.num}',
                          style: theme.primaryTextTheme.headline6,
                        ),
                      ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_planet.name}',
                                style: theme.textTheme.headline5,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Solar System',
                                style: theme.primaryTextTheme.headline3,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              KnowMore(),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Image.asset(
            _planet.image,
            width: 210,
          ),
          top: 0,
        ),
      ],
    );
  }
}
